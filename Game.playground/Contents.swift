
// MARK: - Random names
class RandomName {
    static let names = ["Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "William", "Sophia", "Elijah", "Isabella", "James", "Charlotte"]
    
    static func get() -> String {
        return "\(names.randomElement()!) \(Int.random(in: 1...255))"
    }
}
// MARK: - Character classes
class Player {
    var name: String
    var health: Int
    var damage: Int
    
    var team: Team
    
    init(name: String, health: Int, damage: Int, team: Team) {
        self.health = health
        self.name = name
        self.damage = damage
        self.team = team
    }
    
    func die() {
        print("\(name) (\(team.name)) is dead now.")
        team.remove(player: self)
    }
    
    func info() -> String {
        return "\(name): hp = \(health), dmg = \(damage)"
    }
}

class Warrior: Player {
    var armor: Int
    
    init(name: String, health: Int, damage: Int, armor: Int, team: Team) {
        self.armor = armor
        super.init(name: name, health: health, damage: damage, team: team)
    }
    
    func attack(player: Player) {
        if player is Warrior {
            let enemy = player as! Warrior
            enemy.health -= (self.damage - enemy.armor)
        }
        if player is Mage {
            let enemy = player as! Mage
            enemy.health -= self.damage
        }
        if player.health <= 0 {
            player.die()
        }
    }
    
    func getItem(item: Item ) {
        if item is HealthPotion {
            self.health += (item as! HealthPotion).healValue
            print("\(name) heals by \((item as! HealthPotion).healValue) hp")
        }
        if item is ArmorItem {
            self.armor += (item as! ArmorItem).additionalArmor
            print("\(name) gets \((item as! ArmorItem).additionalArmor) armor")
        }
        if item is Weapon {
            self.damage += (item as! Weapon).additionalDamage
            print("\(name) gets weapon with \((item as! Weapon).additionalDamage) additional damage")
        }
    }
    
    override func info() -> String {
        return super.info() + ", arm = \(armor)"
    }
}

class Mage: Player {
    var mana: Int
    
    init(name: String, health: Int, damage: Int, mana: Int, team: Team) {
        self.mana = mana
        super.init(name: name, health: health, damage: damage, team: team)
    }
    
    override func info() -> String {
        return super.info() + ", mana = \(mana)"
    }
    
    func attack(player: Player) {
        if player is Warrior {
            let enemy = player as! Warrior
            if self.mana >= enemy.armor {
                self.mana -= enemy.armor
                enemy.health -= self.damage
            } else {
                enemy.health -= (self.damage - enemy.armor)
            }
        }
        if player is Mage {
            let enemy = player as! Mage
            enemy.health -= self.damage
        }
        
        if player.health <= 0 {
            player.die()
        }
    }
    
    func getItem(item: Item ) {
        if item is HealthPotion {
            self.health += (item as! HealthPotion).healValue
            print("\(name) heals by \((item as! HealthPotion).healValue) hp")
        }
        if item is ManaPotion {
            self.mana += (item as! ManaPotion).manaHealValue
            print("\(name) gets \((item as! ManaPotion).manaHealValue) mp")
        }
        if item is Weapon {
            self.damage += (item as! Weapon).additionalDamage
            print("\(name) gets weapon with \((item as! Weapon).additionalDamage) additional damage")
        }
    }

}
// MARK: - Team class
class Team {
    var name: String
    var players: [Player] = []
    var isOut: Bool { return players.isEmpty }
    
    init(name: String) {
        self.name = name
        for _ in 1...2 {
            self.players.append(Warrior(name: RandomName.get(),
                                   health: Int.random(in: 10...20),
                                   damage: Int.random(in: 10...20),
                                   armor:Int.random(in: 0...5),
                                   team: self))
        }
        for _ in 1...2 {
            self.players.append(Mage(name: RandomName.get(),
                                   health: Int.random(in: 5...15),
                                   damage: Int.random(in: 15...25),
                                   mana:Int.random(in: 0...10),
                                   team: self))
        }

    }
    
    func remove(player: Player) {
        players = players.filter{ $0.name != player.name}
    }
    
    func printInfo() {
        print(name)
        for player in players {
            print(player.info())
        }
    }
}

// MARK: - Item classes

protocol Item {}

class HealthPotion : Item {
    var healValue: Int
    init(healValue: Int) {
        self.healValue = healValue
    }
}

class ManaPotion : Item {
    var manaHealValue: Int
    init(manaHealValue: Int) {
        self.manaHealValue = manaHealValue
    }
}

class ArmorItem : Item {
    var additionalArmor: Int
    init(additionalArmor: Int) {
        self.additionalArmor = additionalArmor
    }
}

class Weapon : Item {
    var additionalDamage: Int
    init(additionalDamage: Int) {
        self.additionalDamage = additionalDamage
    }
}

class Items {
    static func randomItemForWarrior() -> Item {
        var items: [Item] = []
        items.append(HealthPotion(healValue: Int.random(in: 1...3)))
        items.append(ArmorItem(additionalArmor: Int.random(in: 1...6)))
        items.append(Weapon(additionalDamage: Int.random(in: 1...3)))
        return items.randomElement()!
    }
    static func randomItemForMage() -> Item {
        var items: [Item] = []
        items.append(HealthPotion(healValue: Int.random(in: 1...5)))
        items.append(ManaPotion(manaHealValue: Int.random(in: 1...3)))
        items.append(Weapon(additionalDamage: Int.random(in: 1...4)))
        return items.randomElement()!
    }
}

// MARK: - Game classes
class Game {
    var teams: [Team] = []
    
    var isGameOver: Bool { teams.count <= 1 }
    
    init(numberOfTeams: Int) {
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Team #\(i)"))
        }
    }
    
    func start() {
        var roundCounter = 1
        while !isGameOver {
            var i = 0
            while i <= teams.count - 2 {
                print("Round #\(roundCounter)\n")
                let round = Round(team1: teams[i], team2: teams[i + 1])
                round.start()
                i += 2
                roundCounter += 1
                
                print()
                print("End of the round.\n")
            }
            teams = teams.filter{ !$0.isOut }
            
            startRewarding()
            
            printTeams()
        }
        
        print("Winner of the game - \(teams.first!.name)")
    }
    
    func startRewarding() {
        print("Start rewarding players")
        for team in teams {
            for player in team.players {
                if player is Warrior {
                    (player as! Warrior).getItem(item: Items.randomItemForWarrior())
                }
                if player is Mage {
                    (player as! Mage).getItem(item: Items.randomItemForMage())
                }
            }
        }
        print()
    }
    
    func printTeams() {
        print("All teams:")
        for team in teams {
            print(team.name)
        }
        print()
    }
}

class Round {
    var team1: Team
    var team2: Team
    
    init(team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func start() {
        print("\(team1.name) vs \(team2.name)")
        team1.printInfo()
        team2.printInfo()
        print()
        
        for player in team1.players {
            if team2.isOut {
                print("\(team2.name) is out of game.")
                return
            }
            if let playerWarrior = player as? Warrior {
                if let enemy = team2.players.randomElement() {
                    playerWarrior.attack(player: enemy)
                }
            }
            if team2.isOut {
                print("\(team2.name) is out of game.")
                return
            }
            if let playerMage = player as? Mage {
                if let enemy = team2.players.randomElement() {
                    playerMage.attack(player: enemy)
                }
            }
        }
        for player in team2.players {
            if team1.isOut {
                print("\(team1.name) is out of game.")
                return
            }
            if let playerWarrior = player as? Warrior {
                if let enemy = team1.players.randomElement() {
                    playerWarrior.attack(player: enemy)
                }
            }
            if team1.isOut {
                print("\(team1.name) is out of game.")
                return
            }
            if let playerMage = player as? Mage {
                if let enemy = team1.players.randomElement() {
                    playerMage.attack(player: enemy)
                }
            }
        }
        
    }
    
}

let game = Game(numberOfTeams: 8)
game.start()
//let player = Warrior(name: "A", health: 10, damage: 10, armor: 10, team: Team(name:"aaa"))
//player.getItem(item: HealthPotion(healValue: 10))

