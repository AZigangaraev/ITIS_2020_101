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

class GoldenGloves: Artefacts {
    
    var name: String = "Golden Gloves"
    
    var hpPlus: Int = 5
    
    var damagePlus: Int = 10
}

class WoodenSword: Artefacts {
    
    var name: String = "Wooden Sword"
    
    var hpPlus: Int = 0
    
    var damagePlus: Int = 1

}

class AdamApple: Artefacts {
    
    var name: String = "Adam's Apple"
    
    var hpPlus: Int = -5
    
    var damagePlus: Int = 10
}

class ItisStudCart: Artefacts {
    
    var name: String = "Itis Student Card"
    
    var hpPlus: Int = -1
    
    var damagePlus: Int = 1
}

class Elf: Teammate {
    
    var name: String = "Elf"
    
    var artefacts: Artefacts? = nil
    
    var damage: Int = 30
    
    var id: Int = 1
    
    var hp: Int = 100
    
   
    
}

class Magician: Teammate {
    
    var name: String = "Magician"
    
    var damage: Int = 40
    
    var id: Int = 2
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Knight: Teammate {
    
    var name: String = "Knight"
    
    var damage: Int = 35
    
    var id: Int = 3
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Asassin: Teammate {
    
    var name: String = "Asassin"
    
    var damage: Int = 45
    
    var id: Int = 4
    
    var hp: Int = 100
    
    var artefacts: Artefacts? = nil
}

class Fight {
    
    func hit(unitOfFirstTeam: Teammate,unitOfSecondTeam: Teammate, countOfFights: Int) {
        
        var fighter: Teammate
        var enemy: Teammate
//        print(countOfFights)
        if countOfFights % 2 == 0 {
            fighter = unitOfFirstTeam
            enemy = unitOfSecondTeam
            enemy.hp -= fighter.damage
            if fighter.artefacts != nil {
                artefacrUse(whoUse: fighter, onWhom: enemy)
                fighter.artefacts == nil
            }
            unitOfSecondTeam.hp == enemy.hp
            print(" 💥 Unit \(unitOfSecondTeam.name) got damage \(unitOfFirstTeam.damage) he has \(unitOfSecondTeam.hp) health now 💥 ")
        }
        else {
            fighter = unitOfSecondTeam
            enemy = unitOfFirstTeam
            enemy.hp -= fighter.damage
            if fighter.artefacts != nil {
                 artefacrUse(whoUse: fighter, onWhom: enemy)
                 fighter.artefacts == nil
            }
            unitOfFirstTeam.hp == enemy.hp
            print(" 🔥 Unit  \(unitOfFirstTeam.name) got damage \(unitOfSecondTeam.damage) he has \(unitOfFirstTeam.hp) health now 🔥 ")
            
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
                hero.artefacts = GoldenGloves()
            case 2:
                hero.artefacts = WoodenSword()
            case 3:
                hero.artefacts = AdamApple()
            case 4:
                hero.artefacts = ItisStudCart()
            default:
                hero.artefacts = nil
            }
        print(hero.name, "now has \(hero.artefacts!.name)")
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
            units.append(Elf())
            
        case 2:
            units.append(Magician())
            
        case 3:
            units.append(Knight())
            
        case 4:
            units.append(Asassin())
            
        default:
            units.append(Elf())
          }
            
       }
        print(" ❗ Team \(name) has been created . Now you have 4 units, unit number one is \(units[0].name), unit number 2 is \(units[1].name), unit number 3 is \(units[2].name), unit number 4 is \(units[3].name) ❗ ")
        
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
        
        print("Now create teams")
        for i in 1...teamsNumber {
            teams.append(Team(name: i))
            teams[i-1].createTeam()
            print("_____________________________")
        }
        print("All teams has been created, now we can start a game")
        
    }
    
    func startRound(){
        print("Round number \(roundNumber) starts now")
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
            print("⚡️ Battle between team number \(firstTeam.name) and team number \(secondTeam.name) ⚡️")
            winners.append(Battle(firstTeam: firstTeam, secondTeam: secondTeam))
            
            
            for units in 0..<winners.last!.units.count{
                
                artefactsFind.artefcatsFind(forWhom: winners.last!.units[units])
            }
            
            print("🔴 Team number \(winners.last!.name) has won this battle, \(winners.last!.units.count) heroes left 🔴")
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
            print("Fight between \(firstU.name) and \(secondU.name)")
            while firstU.hp > 0 && secondU.hp > 0 {
                
                fight.hit(unitOfFirstTeam: firstU, unitOfSecondTeam: secondU, countOfFights: countOF)
                countOF += 1
            }
            if firstU.hp <= 0 {
                print(" ☠️ Hero \(firstU.name) lost, 🙌🏻 hero \(secondU.name) win from \(secondTeam.name) team")
                firstTeam.units.remove(at: first)
                amountOfFirst -= 1
//                print(firstTeam.units.count, "amount of heroes in \(firstTeam.name)")
            }
            else {
                print(" ☠️ Hero \(secondU.name) lost, 🙌🏻 hero \(firstU.name) win from \(firstTeam.name) team")
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
        print("Team \(teams.last!.name) WON ")
    }
    
    
}

var game1 = Game()
game1.start()
