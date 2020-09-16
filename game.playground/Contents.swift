protocol Teammate {
    
    var damage: Int { get set }
    var name: String { get }
    var hp: Int { get set }
    var artefacts: Artefacts? { get set }
   
    
}

protocol Artefacts {
    
    var name: String { get }
    
    var hpPlus: Int { get }
    
    var damagePlus: Int { get }
}

class ShovelHelmet: Artefacts {
    
    var name: String = "Лопата и шлем"
    
    var hpPlus: Int = 5
    
    var damagePlus: Int = 10
}

class GolderSword: Artefacts {
    
    var name: String = "Золотой меч"
    
    var hpPlus: Int = 0
    
    var damagePlus: Int = 1

}

class SharpApple: Artefacts {
    
    var name: String = "Острое яблоко"
    
    var hpPlus: Int = -5
    
    var damagePlus: Int = 10
}

class ItisStudCart: Artefacts {
    
    var name: String = "Студенческий билет ИТИС"
    
    var hpPlus: Int = -1
    
    var damagePlus: Int = 1
}

class Archer: Teammate {
    
    var name: String = "Лучник"
    
    var artefacts: Artefacts? = nil
    
    var damage: Int = 30
    
    var id: Int = 1
    
    var hp: Int = 100
    
   
    
}

class Mage: Teammate {
    
    var name: String = "Боевой маг"
    
    var damage: Int = 40
    
    var id: Int = 2
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Knight: Teammate {
    
    var name: String = "Паладин"
    
    var damage: Int = 35
    
    var id: Int = 3
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Asassin: Teammate {
    
    var name: String = "Вор"
    
    var damage: Int = 45
    
    var id: Int = 4
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Fight {
    
    func hit(unitOfFirstTeam: Teammate,unitOfSecondTeam: Teammate, countOfPlayers: Int) {
        
        var fighter: Teammate
        var enemy: Teammate
        if countOfPlayers % 2 == 0 {
            fighter = unitOfFirstTeam
            enemy = unitOfSecondTeam
            let enemyHp = enemy.hp
            enemy.hp -= fighter.damage
            if fighter.artefacts != nil {
                artefacrUse(whoUse: fighter, onWhom: enemy)
                fighter.artefacts == nil
            }
            unitOfSecondTeam.hp == enemy.hp
            print(" Игрок  \(unitOfSecondTeam.name)  получил урон \(unitOfFirstTeam.damage) хп было \(enemyHp) хп теперь \(unitOfSecondTeam.hp )")
        }
        else {
            fighter = unitOfSecondTeam
            enemy = unitOfFirstTeam
            let enemyHp = enemy.hp
            enemy.hp -= fighter.damage
            if fighter.artefacts != nil {
                 artefacrUse(whoUse: fighter, onWhom: enemy)
                 fighter.artefacts == nil
            }
            unitOfFirstTeam.hp == enemy.hp
            print(" Игрок  \(unitOfFirstTeam.name) получил урон \(unitOfSecondTeam.damage) хп было \(enemyHp) хп теперь \(unitOfFirstTeam.hp)")
            
        }
    }
    
    func artefacrUse(whoUse: Teammate, onWhom: Teammate){
        var user = whoUse
        var getter = onWhom
        if whoUse.artefacts?.hpPlus != 0 {
            user.hp += onWhom.artefacts!.hpPlus
            whoUse.hp == user.hp
        }
        user.damage += whoUse.artefacts!.damagePlus
        whoUse.damage == user.damage
        getter.hp -= whoUse.damage
        onWhom.hp == getter.hp
    }
    
    func artefcatsFind(forWhom: Teammate) -> Teammate {
        var countOfArtef: Int
        var hero = forWhom
        countOfArtef = Int.random(in: 1...4)
            switch countOfArtef {
            case 1:
                hero.artefacts = ShovelHelmet()
            case 2:
                hero.artefacts = GolderSword()
            case 3:
                hero.artefacts = SharpApple()
            case 4:
                hero.artefacts = ItisStudCart()
            default:
                hero.artefacts = nil
            }
        print(hero.name, "получил \(hero.artefacts!.name)")
        return hero
    }
}



class Team {
    
    var units: [Teammate] = []
    var name: Int
    
    init(name: Int)
    {
        self.name = name
    }
    
    func createTeam() {
        
        for i in 1...4 {
            
            
            
            
        switch i {
            
        case 1:
            units.append(Archer())
            
        case 2:
            units.append(Mage())
            
        case 3:
            units.append(Knight())
            
        case 4:
            units.append(Asassin())
            
        default:
            units.append(Archer())
          }
            
       }
        print(" Команда \(name) создана . Теперь у тебя 4 игрока, первый игрок \(units[0].name), второй игрок \(units[1].name), третий игрок \(units[2].name), четвертый игрок \(units[3].name)  ")
        
    }
}


class Game {
    var teams: [Team] = []
    var roundNumber: Int = 1
    
    func creatingTeams(k: Int) {
        var teamsNumber: Int = 1
        for _ in 0..<k {
            teamsNumber *= 2
        }
        
        print("Создание команды")
        for i in 1...teamsNumber {
            teams.append(Team(name: i))
            teams[i-1].createTeam()
            print("_____________________________")
        }
        print("Все команды были созданы. Начало игры")
        
    }
    
    func startRound(){
        print("Раунд номер \(roundNumber) начинается")
        var choosingTeam: Int
        var teamsForRound = teams
        var winners: [Team] = []
        let artefactsFind = Fight()
        for _ in 0..<(teams.count/2) {
            choosingTeam = Int.random(in: 0..<teamsForRound.count)
            let firstTeam = teamsForRound[choosingTeam]
            teamsForRound.remove(at: choosingTeam)
            choosingTeam = Int.random(in: 0..<teamsForRound.count)
            let secondTeam = teamsForRound[choosingTeam]
            teamsForRound.remove(at: choosingTeam)
            print("Сражение между командой номер \(firstTeam.name) и командой номер \(secondTeam.name) ")
            winners.append(Battle(firstTeam: firstTeam, secondTeam: secondTeam))
            
            
            for units in 0..<winners.last!.units.count{
                
                artefactsFind.artefcatsFind(forWhom: winners.last!.units[units])
            }
            
            print("Команда номер \(winners.last!.name) победила, \(winners.last!.units.count) игроков выбыло")
        }
        self.teams = winners
        roundNumber += 1
    }
    
    func Battle(firstTeam: Team, secondTeam: Team) -> Team {
        var countOF = 0
        var amountOfFirst = firstTeam.units.count
        var amountOfSecond = secondTeam.units.count
        while amountOfFirst != 0 && amountOfSecond != 0 {
            let first = Int.random(in: 0..<firstTeam.units.count)
            let second = Int.random(in: 0..<secondTeam.units.count)
            let firstU = firstTeam.units[first]
            let secondU = secondTeam.units[second]
            let fight = Fight()
            countOF = 0
            print("Битва между \(firstU.name) и \(secondU.name)")
            while firstU.hp > 0 && secondU.hp > 0 {
                
                fight.hit(unitOfFirstTeam: firstU, unitOfSecondTeam: secondU, countOfPlayers: countOF)
                countOF += 1
            }
            if firstU.hp <= 0 {
                print(" Герой \(firstU.name) выбыл, герой \(secondU.name) победил из \(secondTeam.name) команды")
                firstTeam.units.remove(at: first)
                amountOfFirst -= 1
//                print(firstTeam.units.count, "amount of heroes in \(firstTeam.name)")
            }
            else {
                print(" Герой \(secondU.name) выбыл, герой \(firstU.name) победил из \(firstTeam.name) команды")
                secondTeam.units.remove(at: second)
                amountOfSecond -= 1
//                print(secondTeam.units.count, "amount of heroes in \(secondTeam.name)")
            }
        }
        
        if amountOfFirst == 0 {
            return secondTeam
        }
        else {
            return firstTeam
        }
    }
    
    func start() {
        creatingTeams(k: 2)
        while teams.count != 1 {
            startRound()
        }
        print("Команда \(teams.last!.name) ПОБЕДИЛА ")
    }
    
    
}

var game1 = Game()
game1.start()
