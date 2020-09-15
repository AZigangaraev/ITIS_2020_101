import UIKit

class Soldier {
    var healthPoint: Int
    var name: String
    var equipment: Equipment? = nil
    var damageScore: Int

    init(name: String) {
        self.name = name
        healthPoint = 100
        damageScore = 10
    }

    func hit(to enemy: Soldier) {
        enemy.healthPoint = enemy.healthPoint - Int.random(in: damageScore...damageScore+10)+(equipment?.damageBonus ?? 0)
        print("\(self.name) hit \(enemy.name) HP left: \(enemy.healthPoint)")
    }

    func heroIsAlive() -> Bool {
        if healthPoint > 0 {
            return true
        }
        return false
    }
    
    func findEquipment() {
        let gun = Int.random(in: 1...4)
        switch gun {
        case 1:
            equipment = Shotgun.init()
        case 2:
            equipment = Grenade.init()
        case 3:
            equipment = Rifle.init()
        default:
            equipment = nil
        }
    }
}

protocol Equipment {
    var name: String { get }
    var damageBonus: Int { get }
}

class Rifle: Equipment {
    var name: String = "AWP"
    var damageBonus: Int = 20
}

class Shotgun: Equipment {
    var name: String = "MAC-7"
    var damageBonus: Int = 10
}

class Grenade: Equipment {
    var name: String = "Grenade"
    var damageBonus: Int = 15
}

class Sniper: Soldier {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        healthPoint = 100
        damageScore = 15
    }
}

class Infantryman: Soldier {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        healthPoint = 100
        damageScore = 10
    }
}

class Team {
    var soldiers: [Soldier] = []
    var name: String

    init(name: String) {
        self.name = name
        soldiers.append(Soldier(name: "Soldier"))
        soldiers.append(Sniper(name: "Sniper"))
        soldiers.append(Infantryman(name: "Infantryman"))
        soldiers.append(Soldier(name: "Soldier"))
    }
}

class Battle {
    var teams: [Team] = []
    var teamsCount: Int
    
    init(n: Int) {
        teamsCount = 1
        for _ in 0..<n {
            teamsCount *= 2
        }
        self.createTeams()
    }
    
    func createTeams() {
        for i in 1...teamsCount {
            teams.append(Team(name: "Team \(i)"))
            print(teams[i-1].name + "join")
        }
    }
    
    func takeEquipment() {
        print("Teams start to take an equipments")
        let items = Int.random(in: 1...10)
        for _ in 0...items {
            let team = teams[Int.random(in: 0..<teams.count)]
            let soldier = team.soldiers[Int.random(in: 0..<team.soldiers.count)]
            soldier.findEquipment()
        }
        print("Teams stop taking equipments")
    }
    
    func teamsFight(firstTeam: Team, secondTeam: Team) -> Team {
        print("Teams are fighting")
        while firstTeam.soldiers.count != 0 && secondTeam.soldiers.count != 0 {
            firstTeam.soldiers.first?.hit(to: secondTeam.soldiers.first!)
            if secondTeam.soldiers.count == 0 {
                break
            }
            if (secondTeam.soldiers.first?.healthPoint)! == 0 {
                print(firstTeam.soldiers.first!.name + " from " + firstTeam.name + " kill the "
                    + secondTeam.soldiers.first!.name + " from " + secondTeam.name)
                secondTeam.soldiers.remove(at: 0)
            }
            if firstTeam.soldiers.count == 0 {
            break
            }
        }
        if firstTeam.soldiers.count == 0 {
            print(secondTeam.name + " win fight")
            return secondTeam
        } else {
            print(firstTeam.name + " win fight")
            return firstTeam
        }
    }
    
    func gameFight() {
        while teams.count != 1{
            teams.insert(teamsFight(firstTeam: teams.popLast()!, secondTeam: teams.popLast()!), at: 0)
        }
        print("Game over")
        print(teams.popLast()!.name + " win!")
    }
}

let game = Battle(n: 3)
game.takeEquipment()
game.gameFight()

