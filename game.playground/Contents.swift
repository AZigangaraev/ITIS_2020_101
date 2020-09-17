protocol Teammate {
    
    var name: String { get }
    var artefacts: Artefacts? { get set }
    var damage: Int { get set }
    var hp: Int { get set }
    
   
    
}

protocol Artefacts {
    
    var name: String { get }
    
    var hpPlus: Int { get }
    
    var damagePlus: Int { get }
}

class  ArmletOfMordiggian: Artefacts {
    
    var name: String = "Armlet of Mordiggian"
    
    var hpPlus: Int = 10
    
    var damagePlus: Int = 15
}

class NullTalisman: Artefacts {
    
    var name: String = "Null Talisman"
    
    var hpPlus: Int = 1
    
    var damagePlus: Int = 2

}

class  HeartOfTarrasque: Artefacts {
    
    var name: String = "Heart of Tarrasque"
    
    var hpPlus: Int = 25
    
    var damagePlus: Int = 1
}

class Daedalus: Artefacts {
    
    var name: String = "Daedalus"
    
    var hpPlus: Int = 3
    
    var damagePlus: Int = 23
}

class WitchDoctor: Teammate {
    
    var name: String = "Witch Doctor"
    
    var artefacts: Artefacts? = nil
    
    var damage: Int = 15
    
    var id: Int = 1
    
    var hp: Int = 70
    
   
    
}

class Slark: Teammate {
    
    var name: String = "Slark"
    
    var damage: Int = 40
    
    var id: Int = 2
    
    var hp: Int = 120
    
    var artefacts: Artefacts? = nil
}

class Pudge: Teammate {
    
    var name: String = "Pudge"
    
    var damage: Int = 45
    
    var id: Int = 3
    
    var hp: Int = 170
    
    var artefacts: Artefacts? = nil
}

class Sniper: Teammate {
    
    var name: String = "Sniper"
    
    var damage: Int = 25
    
    var id: Int = 4
    
    var hp: Int = 90
    
    var artefacts: Artefacts? = nil
}

class Fight {
    
    func impact(playerOfFirstTeam: Teammate,playerOfSecondTeam: Teammate, quantityOfFights: Int) {
        
        var attacker: Teammate
        var protecter: Teammate
        if quantityOfFights % 2 == 0 {
            attacker = playerOfFirstTeam
            protecter = playerOfSecondTeam
            protecter.hp -= attacker.damage
            if attacker.artefacts != nil {
                artefacrUse(whoUse: attacker, onWhom: protecter)
                attacker.artefacts == nil
            }
            playerOfSecondTeam.hp == protecter.hp
            print("Player \(playerOfSecondTeam.name) got damage \(playerOfFirstTeam.damage) he has \(playerOfSecondTeam.hp) health now ")
        }
        else {
            attacker = playerOfSecondTeam
            protecter = playerOfFirstTeam
            protecter.hp -= attacker.damage
            if attacker.artefacts != nil {
                 artefacrUse(whoUse: attacker, onWhom: protecter)
                 attacker.artefacts == nil
            }
            playerOfFirstTeam.hp == protecter.hp
            print("Player \(playerOfFirstTeam.name) got damage \(playerOfSecondTeam.damage) he has \(playerOfFirstTeam.hp) health now ")
            
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
    
    func findingArtifacts(forWhom: Teammate) -> Teammate {
        var countOfArtefacts: Int
        var hero = forWhom
        countOfArtefacts = Int.random(in: 1...4)
            switch countOfArtefacts {
            case 1:
                hero.artefacts = ArmletOfMordiggian()
            case 2:
                hero.artefacts = NullTalisman()
            case 3:
                hero.artefacts = HeartOfTarrasque()
            case 4:
                hero.artefacts = Daedalus()
            default:
                hero.artefacts = nil
            }
        print(hero.name, "now has \(hero.artefacts!.name)")
        return hero
    }
}



class Team {
    
    var name: Int
    var units: [Teammate] = []
    
    
    init(name: Int)
    {
        self.name = name
    }
    
    func createTeam() {
        
        for i in 1...4 {
            
            
            
            
        switch i {
            
        case 1:
            units.append(WitchDoctor())
            
        case 2:
            units.append(Slark())
            
        case 3:
            units.append(Pudge())
            
        case 4:
            units.append(Sniper())
            
        default:
            units.append(WitchDoctor())
          }
            
       }
        print(" Team \(name) has been created .Unit 1 -\(units[0].name), unit 2 -\(units[1].name), unit 3 -\(units[2].name), unit  4 -\(units[3].name) ")
        
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
            print("")
        }
        print("All teams are created")
        
    }
    
    func startRound(){
        print("Round number \(roundNumber) starts now")
        var selectTeam: Int
        var teamsForRound = teams
        var winners: [Team] = []
        let findingArtifacts = Fight()
        for _ in 0..<(teams.count/2) {
            selectTeam = Int.random(in: 0..<teamsForRound.count)
            let firstTeam = teamsForRound[selectTeam]
            teamsForRound.remove(at: selectTeam)
            selectTeam = Int.random(in: 0..<teamsForRound.count)
            let secondTeam = teamsForRound[selectTeam]
            teamsForRound.remove(at: selectTeam)
            print(" Fight between team number \(firstTeam.name) and team number \(secondTeam.name) ")
            winners.append(Battle(firstTeam: firstTeam, secondTeam: secondTeam))
            
            
            for units in 0..<winners.last!.units.count{
                
                findingArtifacts.findingArtifacts(forWhom: winners.last!.units[units])
            }
            
            print(" Team number \(winners.last!.name) has won this fight, \(winners.last!.units.count) heroes left ")
        }
        self.teams = winners
        roundNumber += 1
    }
    
    func Battle(firstTeam: Team, secondTeam: Team) -> Team {
        var count = 0
        var quantityOfFirst = firstTeam.units.count
        var quantityOfSecond = secondTeam.units.count
        while quantityOfFirst != 0 && quantityOfSecond != 0 {
            let first = Int.random(in: 0..<firstTeam.units.count)
            let second = Int.random(in: 0..<secondTeam.units.count)
            let first_1 = firstTeam.units[first]
            let second_2 = secondTeam.units[second]
            let fight = Fight()
            count = 0
            print("Fight between \(first_1.name) and \(second_2.name)")
            while first_1.hp > 0 && second_2.hp > 0 {
                
                fight.impact(playerOfFirstTeam: first_1, playerOfSecondTeam: second_2, quantityOfFights: count)
                count += 1
            }
            if first_1.hp <= 0 {
                print(" Hero \(first_1.name) lost, hero \(second_2.name) win from \(secondTeam.name) team")
                firstTeam.units.remove(at: first)
                quantityOfFirst -= 1
            }
            else {
                print(" Hero \(second_2.name) lost, hero \(first_1.name) win from \(firstTeam.name) team")
                secondTeam.units.remove(at: second)
                quantityOfSecond -= 1
            }
        }
        
        if quantityOfFirst == 0 {
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
        print("Team \(teams.last!.name) won")
    }
    
    
}

var Game1 = Game()
Game1.start()
