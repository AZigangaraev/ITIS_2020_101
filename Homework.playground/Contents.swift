class Name {
    static let names = ["John", "Brian", "Tracy", "Susan", "David", "Tony", "Amanda", "Mark", "Andrew", "Kevin", "Sarah", "Alison", "Craig", "Julie", "Angela", "Colin", "Karen", "William", "Gillian", "Fiona", "Michelle", "Michael", "Nicola", "Scott", "Gary", "Jacqueline", "Sharon", "Stuart", "Steven", "Caroline", "Alan", "Louise", "Stephen", "Jennifer", "Donna", "Claire", "Paul", "Elaine", "Christopher", "James"]
    
    static func randomName() -> String {
        return Name.names.randomElement()! + String(Int.random(in: 1...10000))
    }
}

class Player {
    let team: Team
    let name: String
    var maxHP = 50
    var HP: Int
    var damageRange = 10...20

    init(team: Team) {
        self.team = team
        name = Name.randomName()
        HP = maxHP
    }
    
    func heal(addedHP: Int) {
        HP += addedHP
        if HP > maxHP { HP = maxHP }
    }
    
    func attack(player: Player) {
        let damage = Int.random(in: damageRange)
        print("\(name) attacked \(player.name). ", terminator: "")
        if Int.random(in: 1...10) == 7 {
            player.HP -= damage * 2
            print("-\(damage * 2) HP. Double Damage!")
        } else if Int.random(in: 1...20) == 13 {
            print("\(player.name) dodged a blow!")
        } else {
            player.HP -= damage
            print("-\(damage) HP.")
        }
        if player.HP <= 0 { player.die() }
    }
    
    private func die() {
        print("\(name) died.")
        team.remove(player: self)
    }
}

class Team {
    let name: String
    var players: [Player] = []
    var currentPlayerIndex = 0
    var currentPlayer: Player { players[currentPlayerIndex] }
    var isDefeated: Bool { players.isEmpty }
    
    init(name: String) {
        self.name = name
        for _ in 1...4 { players.append(Player(team: self)) }
    }
    
    func nextPlayer() {
        currentPlayerIndex = currentPlayerIndex >= players.count - 1 ? 0 : currentPlayerIndex + 1
    }
    
    func printPlayers() {
        for i in 0..<players.count {
            print("\(i + 1). \(players[i].name) \(players[i].HP) HP")
        }
    }
    
    func remove(player: Player) {
        var index = 0
        while players[index] !== player { index += 1 }
        if currentPlayerIndex >= index && currentPlayerIndex > 0 { currentPlayerIndex -= 1 }
        players.remove(at: index)
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
        print("\n\(team1.name) vs. \(team2.name)")
        printTeams()
        var activePlayer: Player
        while true {
            activePlayer = team1.currentPlayer
            activePlayer.attack(player: team2.players[Int.random(in: 0..<team2.players.count)])
            if team2.isDefeated {
                print("\(team1.name) won.")
                return 0
            }
            team1.nextPlayer()
            
            activePlayer = team2.currentPlayer
            activePlayer.attack(player: team1.players[Int.random(in: 0..<team1.players.count)])
            if team1.isDefeated {
                print("\(team2.name) won.")
                return 1
            }
            team2.nextPlayer()
        }
    }
    
    func printTeams() {
        print("\n\(team1.name):")
        team1.printPlayers()
        print("\(team2.name):")
        team2.printPlayers()
        print()
    }
}

class Game {
    var teams: [Team]
    var isGameOver: Bool { teams.count == 1 }
    
    init(n: Int) {
        var n = n
        if n <= 0 { n = 1 }
        var numberOfTeams = 1, teams = [Team]()
        for _ in 1...n { numberOfTeams *= 2 }
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Team #\(i)"))
        }
        self.teams = teams
    }
    
    func start() {
        print("Welcome to Battle Royale!\n")
        printListOfTeams()
        while !isGameOver {
            var winnersIndices = [Int]()
            var i = 0
            while i <= teams.count - 2 {
                winnersIndices.append(Round(team1: teams[i], team2: teams[i + 1]).start() + i)
                i += 2
                if teams.count != 2 { startItemsCollection() }
            }
            var newTeams = [Team]()
            for index in winnersIndices { newTeams.append(teams[index]) }
            teams = newTeams
        }
        print("\nThe winner is \(teams.first!.name). Congratulations!")
    }
    
    func startItemsCollection() {
        print("\nPlayers started collecting items.")
        for team in teams {
            for player in team.players {
                if Int.random(in: 1...10) <= 4 {
                    let addedHP = Int.random(in: 10...17)
                    player.heal(addedHP: addedHP)
                    print("\(player.name) found an elixir: +\(addedHP) HP.")
                }
                if Int.random(in: 1...10) <= 3 {
                    var lowerBound = player.damageRange.lowerBound
                    var upperBound = player.damageRange.upperBound
                    let addedDamage = Int.random(in: 3...6)
                    lowerBound += addedDamage; upperBound += addedDamage
                    player.damageRange = lowerBound...upperBound
                    print("\(player.name) found a new weapon: +\(addedDamage) damage points.")
                }
                if Int.random(in: 1...10) <= 2 {
                    let addedMaxHP = Int.random(in: 10...20)
                    player.maxHP += addedMaxHP
                    print("\(player.name) found a new suit of armor: now their max HP is \(player.maxHP)")
                }
            }
        }
    }
    
    func printListOfTeams() {
        print("The List of Teams:")
        for team in game.teams {
            print("\(team.name):", terminator: " ")
            for player in team.players { print(player.name, terminator: " ") }
            print()
        }
    }
}

// MARK: - Play
let game = Game(n: 3)
game.start()
