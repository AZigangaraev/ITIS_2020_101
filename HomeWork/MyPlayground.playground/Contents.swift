import UIKit

class Player {
    var damage: Int
    var name: String
    var hp: Int
    var item: Int = 0
    
    init(name: String) {
        self.name = name
        hp = 100
        damage = 12
    }
    
    func fight(with rival: Player) {
        var damageToHero = self.damage
        rival.hp -= self.damage
        if item != 0 {
            rival.hp -= 10
            item -= 1
            damageToHero += 10
        }
        print("\(self.name) damage \(rival.name) damageToHero = \(damageToHero)")
    }
    
    func survivals() -> Bool {
        if hp > 0 {
            return true
        }
        return false
    }
}

class Teams {
    var teamMembers: [Player] = []
    var name: String
    
    init(name: String) {
        self.name = name
        teamMembers.append(Player(name: "1"))
        teamMembers.append(Player(name: "2"))
    }
}

class Game {
    var teams: [Teams] = []
    var Rounds : Int = 1
    
    func prepare(n: Int) {
        var numberOfTeams = 2
        for _ in 0..<n {
            numberOfTeams *= 2
        }
        for i in 1...numberOfTeams {
            teams.append(Teams(name: "Team №\(i)"))
            print(teams.last!.name)
        }
    
    }
    
    func Items() {
        print("Giving items")
        let x = Int.random(in: 0..<5)
        for _ in 0...x {
            let team = teams[Int.random(in: 0..<teams.count)]
            let player = team.teamMembers[Int.random(in: 0..<team.teamMembers.count)]
            player.item += 1
            print(team.name + " give 1 item to " + player.name)
        }
       
    }
    
    func roundPlay() {
        print("Staring \(Rounds) round")
        var teamsTemp = teams
        var results: [Teams] = []
        for _ in 0..<(teams.count/2) {
            var helper = Int.random(in: 0..<teamsTemp.count)
            let teamOne = teamsTemp[helper]
            teamsTemp.remove(at: helper)
            helper = Int.random(in: 0..<teamsTemp.count)
            let teamTwo = teamsTemp[helper]
            teamsTemp.remove(at: helper)
            print("battle between \(teamOne.name) and \(teamTwo.name)")
            results.append(battleBetweenTeams(first: teamOne, second: teamTwo))
         
            print("\(results.last!.name) ending round")
        }
        
        self.teams = results
        Rounds += 1
    }
    
    func battleBetweenTeams (first: Teams, second: Teams) -> Teams {
        var count = 0
        var countFirstPlayers = first.teamMembers.count
        var countSecondPlayers = second.teamMembers.count
        while countFirstPlayers != 0 && countSecondPlayers != 0 {
            let one = Int.random(in: 0..<first.teamMembers.count)
            let two = Int.random(in: 0..<second.teamMembers.count)
            let FirstPlayer = first.teamMembers[one]
            let SecondPlayer = second.teamMembers[two]
            if count % 2 == 0 {
               FirstPlayer.fight(with: SecondPlayer)
                if SecondPlayer.survivals() == false {
                    print("\(SecondPlayer.name) is dead")
                    second.teamMembers.remove(at: two)
                    countSecondPlayers -= 1
                    if countSecondPlayers == 0 {
                        print("\(second.name) lost")
                    }
                }
            } else {
                SecondPlayer.fight(with: FirstPlayer)
                if FirstPlayer.survivals() == false {
                    print("\(SecondPlayer.name) is dead")
                    first.teamMembers.remove(at: one)
                    countFirstPlayers -= 1
                    if countFirstPlayers == 0 {
                        print("\(first.name)going to lost the game")
                    }
                }
            }
            count += 1
        }
        if first.teamMembers.count == 0 {
            return second
        }
        return first
    }
    
    func startGame() {
        prepare(n: 3)
        Items()
        while teams.count != 1 {
            roundPlay()
            if Int.random(in: 0...5) == 2 {
                Items()
            }
        }
        print("\(teams.last!.name) won")
    }
}

var RoyalGame = Game()
RoyalGame.startGame()
