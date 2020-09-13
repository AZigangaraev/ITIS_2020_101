extension Array {
    func getRandom() -> Element {
        return self[Int.random(in: 0..<self.count)]
    }
}

extension Int {
    static func rand(_ upperLimit: Int) -> Int {
        if (upperLimit != 0) {
            return Int.random(in: 0..<upperLimit)
        } else {
            return 0
        }
        
    }
}

class BattleRoyale {
    var teams: [Team]
    
    private let initialTeamCount = 2*8
    
    init() {
        var teams: [Team] = []
        for _ in 0..<initialTeamCount {
            teams.append(Team.init())
        }
        self.teams = teams
    }
    
    func teamDestroyed(index: Int, msg: String) {
        self.teams.remove(at: index)
        print(msg)
    }
    
    func fightTeams() -> (destroyedTeam: Int, killer: Int)? {
        let fightingTeams: (Int, Int) = (first: Int.rand(teams.count), second: Int.rand(teams.count))
        
        if (fightingTeams.0 == fightingTeams.1) {
            print("All quite on the western front")
            return nil
        } else {
            let team1 = teams[fightingTeams.0], team2 = teams[fightingTeams.1]
            
            while team1.members.count > 0 && team2.members.count > 0 {
                if (Bool.random()) {
                    team2.memberAttacked(by: team1.sendAttacker())
                } else {
                    team1.memberAttacked(by: team2.sendAttacker())
                }
            }
            
            if (team1.members.count == 0) {
                return (destroyedTeam: fightingTeams.0, killer: fightingTeams.1)
            } else {
                return (destroyedTeam: fightingTeams.1, killer: fightingTeams.0)
            }
        }
    }
    
    func collectLoot() {
        for i in 0..<teams.count {
            if (i >= teams.count) {
                return
            }
            
            let team = teams[i]
            
            /*
             for member in 0..<Int.rand(team.members.count) {
             if (member + 1 < team.members.count) {
             if let item = team.members[member].loot() {
             team.memberDied(index: member, msg: "\(team.members[member]) died from \(item.name)")
             }
             }
             }*/
            
            
            let member = Int.rand(team.members.count)
            if let item = team.members[member].loot() {
                team.memberDied(index: member, msg: "\(team.members[member].name) from team \(team.members[member].team.name) died from \(item.name)")
            }
            
            
            if (team.members.count == 0) {
                self.teamDestroyed(index: i, msg: "\(team.name) got destroyed by looting")
            }
        }
    }
    
    func startBattle() {
        var round = 1
        while teams.count >= 2 {
            print("Round \(round) starts \n")
            if let result = self.fightTeams() {
                self.teamDestroyed(index: result.destroyedTeam, msg: "\(teams[result.destroyedTeam].name) were destroyed by \(teams[result.killer].name)")
            }
            
            if (teams.count != 1) {
                self.collectLoot()
            }
            
            round += 1
        }
        
        print("\(teams[0].name) won the battle royale with \(teams[0].members.count) members")
    }
}

class Team {
    let name: String
    lazy var members: [Human] = self.setUpTeam()
    
    private let defaultTeamSize = 4
    
    private func setUpTeam() -> [Human]{
        var members: [Human] = []
        for _ in 0..<defaultTeamSize {
            members.append(Human(team: self))
        }
        return members
    }
    
    init() {
        if (teamNames.count != 0) {
            let index = Int.rand(teamNames.count)
            self.name = teamNames[index]
            teamNames.remove(at: index)
        } else {
            self.name = "Team number:\(Int.rand(6767676767676))"
        }
    }
    
    func sendAttacker() -> Human {
        return members[Int.rand(members.count)]
    }
    
    func memberDied(index: Int, msg: String) {
        self.members.remove(at: index)
        print(msg)
    }
    
    func memberAttacked(by: Human) {
        let index = Int.rand(members.count)
        let member = members[index]
        let dmgAmount = by.dmgAmount()
        
        if (member.hurt(amount: dmgAmount) <= 0) {
            self.memberDied(index: index, msg: "\(member.name) from \(member.team.name) killed by \(by.name) from \(member.team.name)")
        } else {
            //print("\(member.name) dealt \(dmgAmount) to \(by.name) and left him with \(member.changeHP(amount: 0))")
        }
    }
    
    private var teamNames: [String] = [
        "Knights of the Green Moon",
        "Sunlight Warriors",
        "Squad 404",
        "SS",
        "Cats",
        "Panzergrenadier Korps 2",
        "Knights of the Green Moon 2",
        "Sunlight Warriors 2",
        "Squad 404 2",
        "SS 2",
        "Cats 2",
        "Panzergrenadier Korp 2s"
    ]
}

class Human {
    let name: String
    let team: Team
    
    private var hp: Int = 100
    private var dmg: Int = 15
    
    init(team: Team) {
        self.name = nameList.getRandom()
        self.team = team
    }
    
    func dmgAmount() -> Int {
        return Int.rand(dmg)
    }
    
    func hurt(amount: Int) -> Int {
        return changeHP(amount: -amount)
    }
    
    func changeHP(amount: Int) -> Int {
        hp += amount
        return hp
    }
    
    func changeDmg(amount: Int) {
        dmg += amount
    }
    
    func loot() -> Item? {
        let lootedItem = items[Int.rand(items.count)]
        
        print("\(name) from \(team.name) looted \(lootedItem.name)")
        
        if (changeHP(amount: lootedItem.hpBonus) <= 0) {
            return lootedItem
        }
        return nil
    }
    
    private let nameList: [String] = [
        "Karl", "Hanz", "Paul", "Ivan", "Isoruku", "Goring"
    ]
    
    private let items: [Item] = [
        Item(name: "Holy Sword", hpBonus: 15, dmgBouns: 50),
        Item(name: "Short Sword", hpBonus: 0, dmgBouns: 15),
        Item(name: "Long Sword", hpBonus: 10, dmgBouns: 75),
        Item(name: "Cursed Dagger", hpBonus: -25, dmgBouns: 99),
        Item(name: "Pervitin", hpBonus: 20, dmgBouns: 50)
    ]
}

struct Item {
    let name: String
    let hpBonus: Int
    let dmgBouns: Int
}


let MyBattleRoyale: BattleRoyale = BattleRoyale()

MyBattleRoyale.startBattle()
