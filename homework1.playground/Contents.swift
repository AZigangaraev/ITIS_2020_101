// created by Oleg Romanov 11-906
var game = Game()
game.startGame()


class Game {
    let n = 4  //здесь число команд в виде степеней двойки
    var teams: [Team] = []
    var namesForTeam: [String] = ["Червячки", "Черепашки", "Кнопочки", "Курятник", "Пингвины", "Лунатики",
    "Одуванчики", "Радуга", "НЛО", "Феникс", "Мстители", "Надежда", "Пупки", "Котлеты", "Фотоны", "Пупсики"]
    
    func startGame() {
        teamCreate()
        print()
        print("Грандиозное, масштабное, массовое столкновение. Собралась масса народу. \n Все уважаемые нули и единицы(дамы и господа), Встречайте незабываемое столкновение: массив на массив \n И да начнется массива")
        print()
        battleRoyale(array: teams)
    }
    
    private func teamCreate() {
        for _ in 1...n {
        let index = Int.random(in: 0..<namesForTeam.count)
        let teamName = namesForTeam[index]
            namesForTeam.remove(at: index)
        let team = Team(teamName: teamName)
        print("Имя команды: \(teamName)")
        team.setTeam()
        teams.append(team)
        print()
        }
    }
    
    private func battleRoyale(array: [Team]) {
        var index = 0
        var newArray: [Team] = []
        
        while index < array.count - 1 {
            newArray.append(fight(firstTeam: array[index], secondTeam: array[index + 1]))
            index += 2
        }
        
        if newArray.count != 1 {
            battleRoyale(array: newArray)
        } else {
            print("Победили : \(newArray[0].teamName)")
            return
        }
    }
    
    private func fight(firstTeam: Team, secondTeam: Team) -> Team {
        let magicChest = Chest()
        var indexFirstTeam = 0
        var indexSecondTeam = 0
        while firstTeam.isAlive && secondTeam.isAlive {
            
            indexFirstTeam = Int.random(in: 0..<firstTeam.team.count)
            indexSecondTeam = Int.random(in: 0..<secondTeam.team.count)
            
            print("Игрок команды \(firstTeam.teamName) ударяет игрока команды \(secondTeam.teamName)")
            
            firstTeam.team[indexFirstTeam].doDamage(p: secondTeam.team[indexSecondTeam])
            
            if firstTeam.team[indexFirstTeam].isAlive {
                magicChest.openChest(player: firstTeam.team[indexFirstTeam])
            }
            
            if !secondTeam.team[indexSecondTeam].isAlive {
                secondTeam.characterFromTeamIsDead(index: indexSecondTeam)
                if !secondTeam.isAlive {
                    break
                } else {
                    indexSecondTeam = Int.random(in: 0..<secondTeam.team.count)
                }
            }
            
            print("Игрок команды \(secondTeam.teamName) ударяет игрока команды \(firstTeam.teamName)")
            
            secondTeam.team[indexSecondTeam].doDamage(p: firstTeam.team[indexFirstTeam])
            
            if secondTeam.team[indexSecondTeam].isAlive {
                magicChest.openChest(player: secondTeam.team[indexSecondTeam])
            }

            
            if !firstTeam.team[indexFirstTeam].isAlive {
                firstTeam.characterFromTeamIsDead(index: indexFirstTeam)
            }
            
            if !firstTeam.isAlive {
                break
            }
            print()
        }
        
        if firstTeam.isAlive {
            return firstTeam
        } else {
            return secondTeam
        }
    }
}

// Классы персонажей

protocol Player {
    var name: String { get }
    var hp: Int { get }
    var armor: Int { get }
    var damage: Int { get }
    var isAlive: Bool { get set }
    func getDamage(damage: Int)
    func doDamage(p: Player)
    func getArmor(armor: Int)
    func getHeal(hp: Int)
    func damageUp(damage: Int)
}

class Damager: Player {
    var isAlive: Bool = true
    var name: String
    var hp: Int
    var armor: Int
    var damage: Int
    
    init(name: String) {
        self.name = name
        hp = 100
        armor = 50
        damage = 30
    }
    
    func doDamage(p: Player) {
        print("\(self.name) нанес \(self.damage) по \(p.name) противника")
        p.getDamage(damage: damage)
    }
    
    func getDamage(damage: Int) {
        if armor > 0 {
            armor -= damage
        } else {
            hp -= damage
        }
        if hp <= 0 {
            print("\(self.name) выбывает из Королевской битвы...")
            isAlive = false
        }
    }
    
    func getArmor(armor: Int) {
        self.armor += armor
    }
    
    func getHeal(hp: Int) {
        self.hp += hp
    }
    
    func damageUp(damage: Int) {
        self.damage += damage
    }
}

class Tank: Player {
    var isAlive: Bool = true
    var name: String
    var hp: Int
    var armor: Int
    var damage: Int
    
    init(name: String) {
        self.name = name
        hp = 100
        armor = 300
        damage = 15
    }
    
    func doDamage(p: Player) {
        print("\(self.name) нанес \(self.damage) по \(p.name) противника")
        p.getDamage(damage: damage)
    }
    
    func getDamage(damage: Int) {
        if armor > 0 {
            armor -= damage
        } else {
            hp -= damage
        }
        if hp <= 0 {
            print("\(self.name) выбывает из Королевской битвы...")
            isAlive = false
        }
    }
    
    func getArmor(armor: Int) {
        self.armor += armor
    }
    
    func getHeal(hp: Int) {
        self.hp += hp
    }
    
    func damageUp(damage: Int) {
        self.damage += damage
    }
}


class Lucky: Player {
    var isAlive: Bool = true
    var name: String
    var hp: Int
    var armor: Int
    var damage: Int
    
    init(name: String) {
        self.name = name
        hp = 50
        armor = 0
        damage = 7
    }
    
    func doDamage(p: Player) {
        print("\(self.name) нанес \(self.damage) по \(p.name) противника")
        p.getDamage(damage: damage)
    }
    
    func getDamage(damage: Int) {
        if armor > 0 {
            armor -= damage
        } else {
            hp -= damage
        }
        if hp <= 0 {
            print("\(self.name) выбывает из Королевской битвы...")
            isAlive = false
        }
    }
    
    func getArmor(armor: Int) {
        self.armor += armor
    }
    
    func getHeal(hp: Int) {
        self.hp += hp * 2
    }
    
    func damageUp(damage: Int) {
        self.damage += damage * 2
    }
}

class Team {
    var teamName: String
    var team: [Player] = []
    var isAlive = true
        
    init(teamName: String) {
        self.teamName = teamName
    }
    
    func setTeam() {
        var count = 0
        while count < 4 {
            let x = Int.random(in: 1..<4)
            switch x {
            case 1:
                print("Дамагер успешно добавлен в команду")
                team.append(Damager(name: "Damager-\(teamName)"))
                count += 1
            case 2:
                print("Танк успешно добавлен в команду")
                team.append(Tank(name: "Tank-\(teamName)"))
                count += 1
            case 3:
                print("Хиллер успешно добавлен в команду")
                team.append(Lucky(name: "Lucky-\(teamName)"))
                count += 1
            default:
                print("УПС... такого персонажа не существует, попробуйте еще раз")
            }
        }
    }
    
    func characterFromTeamIsDead(index: Int) {
        team.remove(at: index)
        if team.count == 0 {
            isAlive = false
        }
    }
}

class Chest {
    func openChest(player: Player) {
        var randomNumber: Int
        print("Игрок \(player.name) открывает Волшебный Сундук...")
        switch Int.random(in: 0...4) {
        case 0:
            print("Не повезло, Волшебный Сундук оказался пуст...")
        case 1:
            randomNumber = Int.random(in: 10...40)
            print("В Волшебном Сундуке \(player.name) нашел ману, которая увеличила показатель брони на \(randomNumber) единиц")
            player.getArmor(armor: randomNumber)
        case 2:
            randomNumber = Int.random(in: 10...40)
            print("В Волшебном Сундуке \(player.name) нашел зелье здорвья, которое увеличило показатель здоровья на \(randomNumber) единиц")
            player.getHeal(hp: randomNumber)
        case 3:
            randomNumber = Int.random(in: 15...60)
            print("В Волшебном Сундуке \(player.name) нашел зелье урона, которое увеличило показатель урона на \(randomNumber) единиц")
            player.damageUp(damage: randomNumber)
        case 4:
            randomNumber = Int.random(in: 20...35)
            print("Волшебный Сундук оказался Сундуком-Ловушкой и \(player.name) получил урон в размере \(randomNumber) единиц")
            player.getDamage(damage: randomNumber)
        default:
            print()
        }
    }
}



