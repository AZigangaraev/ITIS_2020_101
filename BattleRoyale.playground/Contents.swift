class Team {
    let name: String
    var units: [Unit] = []
    var currentIndex = 0
    var currentUnit: Unit { units[currentIndex] }
    var defeat: Bool { units.isEmpty }
    
    func nextUnit() {
        if currentIndex >= units.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
    }
    
    func printUnits() {
        for i in 0..<units.count {
            print("\(units[i].name) \(units[i].unitHp) HP")
        }
        print("")
    }
    
    func remove(unit: Unit) {
        var index = 0
        while units[index] !== unit {
            index += 1
        }
        if currentIndex >= index && currentIndex > 0 {
            currentIndex -= 1
        }
        units.remove(at: index)
    }
    
    init(name: String) {
        self.name = name
        for _ in 1...4 { units.append(Unit(team: self)) }
    }
}

class Unit {
    let team: Team
    let name: String
    var maxHp = 150
    var unitHp: Int
    var damageRange = 25...30
    
    func heal(plusHp: Int) {
        unitHp += plusHp
        if unitHp > maxHp {
            unitHp = maxHp
        }
    }
    
    func attack(unit: Unit) {
        let damage = Int.random(in: damageRange)
        print("\(name) shot the \(unit.name) and ", terminator: "")
        if Int.random(in: 1...7) == 5 {
            unit.unitHp -= damage * 2
            print("Double damage! \(unit.name) now has \(unit.unitHp) HP")
        } else if Int.random(in: 1...20) == 11 {
            unit.unitHp -= damage * 5
            print("Critical damage!! \(unit.name) now has \(unit.unitHp) HP")
        } else if Int.random(in: 1...100) == 53 {
            unit.unitHp -= damage * 50
            print("ULTRA KILL!!! \(unit.name) now has \(unit.unitHp) HP")
        }else{
            unit.unitHp -= damage
            print("\(unit.name) now has \(unit.unitHp) HP")
        }
        if unit.unitHp <= 0 {
            unit.die()
        }
    }
    
    private func die() {
        print("\(name) is out")
        team.remove(unit: self)
    }
    
    init(team: Team) {
        self.team = team
        name = Name.randomName()
        unitHp = 100
    }
}

class Name {
    static let name: String = "Player"
    
    static func randomName() -> String {
        return Name.name + String(Int.random(in: 1...1000))
    }
}

class Round {
    let team1: Team
    let team2: Team
    
    init(team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func start() -> Int {
        print("\n\(team1.name) vs \(team2.name)")
        print("FIGHT!!!")
        
        print("\n\(team1.name):")
        team1.printUnits()
        print("\(team2.name):")
        team2.printUnits()
        print()
        
        var activeUnit: Unit
        while true {
            activeUnit = team1.currentUnit
            activeUnit.attack(unit: team2.units[Int.random(in: 0..<team2.units.count)])
            if team2.defeat {
                print("\(team1.name) won")
                return 0
            }
            team1.nextUnit()
            
            activeUnit = team2.currentUnit
            activeUnit.attack(unit: team1.units[Int.random(in: 0..<team1.units.count)])
            if team1.defeat {
                print("\(team2.name) won")
                return 1
            }
            team2.nextUnit()
        }
    }
}

class Game {
    var teams: [Team]
    var isGameOver: Bool { teams.count == 1 }
    
    init(n: Int) {
        var n = n
        if n <= 0 {
            n = 1
        }
        var numberOfTeams = 1, teams = [Team]()
        for _ in 1...n {
            numberOfTeams *= 2
        }
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Team \(i)"))
        }
        self.teams = teams
    }
    
    func start() {
        print("Let's Roll!")
        while !isGameOver {
            var winners = [Int]()
            var i = 0
            while i <= teams.count - 2 {
                if teams.count != 2 { loot() }
                winners.append(Round(team1: teams[i], team2: teams[i + 1]).start() + i)
                i += 2
            }
            var newTeams = [Team]()
            for index in winners { newTeams.append(teams[index]) }
            teams = newTeams
        }
        print("\n\(teams.first!.name) win!")
        print("The End.")
    }
    
    func loot() {
        print("\nUnits is looting..")
        for team in teams {
            for unit in team.units {
                if Int.random(in: 1...10) <= 3 {
                    let addHP = Int.random(in: 20...25)
                    unit.heal(plusHp: addHP)
                    print("\(unit.name) found an medic bag: +\(addHP) HP")
                }
                
                if Int.random(in: 1...10) <= 2 {
                    let addHP = Int.random(in: 40...50)
                    unit.heal(plusHp: addHP)
                    print("\(unit.name) found an new bulletproof vest: +\(addHP) HP")
                }
                
                if Int.random(in: 1...50) <= 7 {
                    var lowerBound = unit.damageRange.lowerBound
                    var upperBound = unit.damageRange.upperBound
                    let addDamage = Int.random(in: 30...40)
                    lowerBound += addDamage; upperBound += addDamage
                    unit.damageRange = lowerBound...upperBound
                    print("\(unit.name) found a MINIGUN!!!: +\(addDamage) damage")
                }
                
                if Int.random(in: 1...10) <= 7 {
                    var lowerBound = unit.damageRange.lowerBound
                    var upperBound = unit.damageRange.upperBound
                    let addDamage = Int.random(in: 10...20)
                    lowerBound += addDamage; upperBound += addDamage
                    unit.damageRange = lowerBound...upperBound
                    print("\(unit.name) found a M4A4: +\(addDamage) damage")
                }
            }
        }
    }
}

let game = Game(n: 2)
game.start()
