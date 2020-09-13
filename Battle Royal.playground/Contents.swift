import UIKit

protocol Resource{
    var name: String { get }
    
    var damageBonus: Int { get }
    var healBonus: Int {get}
}

protocol Unit{
    var hp: Int { get set }
    var damage: Int { get }
    var luck: Int { get }
    var haveUniqueSkill: Bool {get set}
    
    var resource: Resource? {get set}
    
    func hit(player: Player)
    func findResource()
    
    func voiceOfDeath()
    func voiceOfKilling()
    func voiceOfHavenotSkill()
    func voiceOfFind()
}

class MagicKnife: Resource{
    var name: String = "MagicKnife"
    
    var damageBonus: Int = 10
    
    var healBonus: Int = 0
    
}

class Medikit: Resource{
    var name: String = "Medikit"
    
    var damageBonus: Int = 0
    
    var healBonus: Int = 10
    
    
}

class Armor: Resource{
    var name: String = "Armor"
    
    var damageBonus: Int = 4
    
    var healBonus: Int = 5
    
    
}

class Knight: Unit{
    
    var hp: Int = 50
    
    var damage: Int = 15
    
    var luck: Int = 3
    
    var haveUniqueSkill: Bool = true
    
    var resource: Resource? = nil
    
    
    func hit(player: Player) {
        if resource == nil{
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)
        }
        else {
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)+resource!.damageBonus
        }
    }
    
    func superHit(player: Player) -> Int {
        if haveUniqueSkill == true {
            haveUniqueSkill = false
            return damage+15+resource!.damageBonus
        }
        voiceOfHavenotSkill()
        return 0;
    }
    
    func findResource() {
        let random = Int.random(in: -5...20) + luck
        
        if random > 10 && random < 13{
            resource = MagicKnife.init()
            voiceOfFind()
        }else if random < 16 {
            resource = Medikit.init()
            voiceOfFind()
        }else if random < 20{
            resource = Armor.init()
            voiceOfFind()
        }else{
        print("Bruh")
        }
    }
    
    func voiceOfDeath() {
        print("I'm dead!")
    }
    
    func voiceOfKilling() {
        print("I killed him!")
    }
    
    func voiceOfHavenotSkill() {
        print("I have'nt special skill")
    }
    
    func voiceOfFind() {
            print("I find something")
    }
    
}

class Druid: Unit{
    
    var hp: Int = 40
    
    var damage: Int = 9
    
    var luck: Int = 10
    
    var haveUniqueSkill: Bool = true
    
    var resource: Resource? = nil
    
    
    func hit(player: Player) {
        if resource == nil{
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)
        }
        else {
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)+resource!.damageBonus
        }
    }
    
    func heal() -> Int {
        if haveUniqueSkill == true {
            haveUniqueSkill = false
            return hp+15 + resource!.healBonus
        }
        voiceOfHavenotSkill()
        return 0;
    }
    
    func findResource() {
        let random = Int.random(in: 0...20) + luck
        
        if random > 10 && random < 13{
            resource = MagicKnife.init()
            voiceOfFind()
        }else if random < 16 {
            resource = Medikit.init()
            voiceOfFind()
        }else if random < 20{
            resource = Armor.init()
            voiceOfFind()
        }else{
        print("Bruh")
        }
    }
    
    func voiceOfDeath() {
        print("I'm dead!")
    }
    
    func voiceOfKilling() {
        print("I killed him!")
    }
    
    func voiceOfHavenotSkill() {
        print("I have'nt special skill")
    }
    
    func voiceOfFind() {
            print("I find something")
    }
    
}

class Assasin: Unit{
    
    var hp: Int = 45
    
    var damage: Int = 11
    
    var luck: Int = 5
    
    var haveUniqueSkill: Bool = true
    
    var resource: Resource? = nil
    
    
    func hit(player: Player){
        if resource == nil{
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)
        }
        else {
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)+resource!.damageBonus
        }
    }
    
    func heal() -> Int {
        if haveUniqueSkill == true {
            haveUniqueSkill = false
            return hp+15
        }
        voiceOfHavenotSkill()
        return 0;
    }
    
    func findResource() {
        let random = Int.random(in: 0...20) + luck
        
        if random > 10 && random < 13{
            resource = MagicKnife.init()
            voiceOfFind()
        }else if random < 16 {
            resource = Medikit.init()
            voiceOfFind()
        }else if random < 20{
            resource = Armor.init()
            voiceOfFind()
        }else{
        print("Bruh")
        }
    }
    
    func voiceOfDeath() {
        print("I'm dead!")
    }
    
    func voiceOfKilling() {
        print("I killed him!")
    }
    
    func voiceOfHavenotSkill() {
        print("I have'nt special skill")
    }
    
    func voiceOfFind() {
            print("I find something")
    }
    
}

class Engineer: Unit{
    
    var hp: Int = 35
    
    var damage: Int = 25
    
    var luck: Int = 6
    
    var haveUniqueSkill: Bool = true
    
    var resource: Resource? = nil
    
    
    func hit(player: Player){
        if resource == nil{
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)
        }
        else {
            player.person.hp = player.person.hp - Int.random(in: damage...damage+10)+resource!.damageBonus
        }
    }
    
    func roberResource(player: Player) {
        if haveUniqueSkill == true {
            haveUniqueSkill = false
            
            resource = player.person.resource!
            player.person.resource = nil
        }
        voiceOfHavenotSkill()
    }
    
    func findResource() {
        let random = Int.random(in: 0...20) + luck
        
        if random > 10 && random < 13{
            resource = MagicKnife.init()
            voiceOfFind()
        }else if random < 16 {
            resource = Medikit.init()
            voiceOfFind()
        }else if random < 20{
            resource = Armor.init()
            voiceOfFind()
        }else{
        print("Bruh")
        }
    }
    
    func voiceOfDeath() {
        print("I'm dead!")
    }
    
    func voiceOfKilling() {
        print("I killed him!")
    }
    
    func voiceOfHavenotSkill() {
        print("I have'nt special skill")
    }
    
    func voiceOfFind() {
            print("I find something")
    }
    
}


class Player {
    let name: String
    
    var person: Unit
    
    init(name: String, person: Unit) {
        self.name = name
        self.person = person
    }
    
}

class Team {
    let teamName: String
    
    var players: [Player]
    
    init(name: String, players: [Player]) {
        teamName = name
        self.players = players
    }
    
    func voiceOfWin() {
        print("Yes! We win it fight!")
    }
    
    func voiceOfDeadTemmate() {
        print("We lost him! Noooo...")
    }
    
    func voiceOfWinOfTheGame() {
        print("We are the best!")
    }
}

class BattleGame{

    var teams: [Team] = []
    
    var countOfTeams: Int
    
    init(n: Double) {
        countOfTeams = Int(pow(2, n))
        self.createTeams()
    }
    
    func createTeams(){
        
        for i in 1...countOfTeams {
            
            var players: [Player] = []
            
            for j in 1...4{
                
                var unit: Unit
                
                switch j {
                case 1:
                    unit = Knight()
                case 2:
                    unit = Druid()
                case 3:
                    unit = Assasin()
                case 4:
                    unit = Engineer()
                default:
                    unit = Knight()
                }
                
                let name = "Alba\(j)"
                
                let player = Player(name: name, person: unit)
                
                players.append(player)
            }
            
            let teamName = "Team\(i)"
            
            let team = Team(name: teamName, players: players)
            
            teams.append(team)
            
            print("\(teamName) created")
            
        }
        print("")
        print("✅ All \(countOfTeams) teams CREATED! ✅")
        print("------------------------------------")
        print("")
    }
    
    func preparatoryRound() {
        print("Preparatory round begin! 🛠")
        for team in teams{
            print("\(team.teamName): ")
            for player in team.players{
                print("\(player.name) - ", terminator: "")
                player.person.findResource()
            }
            print("")
        }
        print("✅ Preparatory round COMPLETED! ✅")
        print("------------------------------------")
        print("")
    }
    
    func battleRound() {
        print("💥FIGHT💥")
        print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        print("")
        var i = 1
        
        while teams.count != 1{
            teams.insert(fight(team1: teams.popLast()! , team2: teams.popLast()!, count: i), at: 0)
            i += 1
        }
        print("⭐️The battle is over⭐️")
        print("______________________________________")
        print("🎁 \(teams.popLast()!.teamName) WIN THIS GAME 🎁")
    }
    
    func fight(team1: Team, team2: Team, count: Int) -> Team{
    
        print("Fight\(count):")
        print("🔥 \(team1.teamName) vs \(team2.teamName) 🔥")
        while team1.players.count != 0 && team2.players.count != 0{
            
            if team2.players.count == 0 {
                break
            }
            
            team1.players.first?.person.hit(player: team2.players.first!)
            
            if (team2.players.first?.person.hp)! < 1 {
                print("☠️ \(team1.teamName):\(team1.players.first!.name) killed \(team2.teamName):\( team2.players.first!.name)")
                print("")
                team2.players.remove(at: 0)
            }
            if team1.players.count == 0 {
                break
            }
            team2.players.first?.person.hit(player: team1.players.first!)
            if (team1.players.first?.person.hp)! < 1 {
                print("☠️ \(team2.teamName):\(team2.players.first!.name) killed \(team1.teamName):\(team1.players.first!.name)")
                print("")
                team1.players.remove(at: 0)
            }
        }
        
        if team1.players.count == 0 {
            print("👑 \(team2.teamName) win fight")
            print("___________")
            return team2
            print("")
            
        }else {
            print("👑 \(team1.teamName) win fight")
            print("___________")
            print("")
            return team1
        }
    }
}

let game = BattleGame(n: 3)
game.preparatoryRound()
game.battleRound()
