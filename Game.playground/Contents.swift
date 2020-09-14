struct Player{
    var name: String
    var damage: Int
    var helf: Int
}
class Team {
    var teamPlayers = [Player]()
    var teamName: String
    var generalDamage: Int
    var generalHelth: Int
    var inTheGame: Bool
    init(name: String,pl1: Player,pl2: Player, pl3: Player,pl4: Player) {
        self.teamName = name
        self.teamPlayers.append(pl1)
        self.teamPlayers.append(pl2)
        self.teamPlayers.append(pl3)
        self.teamPlayers.append(pl4)
        self.generalHelth = pl1.helf + pl2.helf + pl3.helf + pl4.helf
        self.generalDamage = pl1.damage + pl2.damage + pl3.damage + pl4.damage
        self.inTheGame = true
    }
}


class Game{
    
    func roundForTwoTeam(Team1: Team, Team2: Team) -> Team {
        var queFirstTeam = true;
        while((Team1.generalHelth > 0) && (Team2.generalHelth > 0)){
            if (queFirstTeam){
                Team2.generalHelth -= Team1.generalDamage
                queFirstTeam = false
            } else {
                Team1.generalHelth -= Team2.generalDamage
                queFirstTeam = true;
            }
        }
        if(Team1.generalHelth>0){
            print("В битве \(Team1.teamName) и \(Team2.teamName) выиграл \(Team1.teamName)")
            return Team1
        } else {
            print("В битве \(Team1.teamName) и \(Team2.teamName) выиграл \(Team2.teamName)")
            return Team2
        }
    }
    
    func round(teams:[Team]) -> [Team] {
        var n1 = 1;
        var result:[Team] = []
        for _ in 1...teams.count/2{
            result.append(roundForTwoTeam(Team1: teams[n1-1], Team2: teams[n1]))
            
            n1 += 2
        }
        return result
    }
    
    func bonus(teams:[Team]) -> [Team]{
        
        var result = [Team]()
        
        for i in teams{
            let bonH = Int.random(in: 0...10)
            i.generalHelth += bonH
            let bonD = Int.random(in: 0...10)
            i.generalDamage += bonD
            result.append(i)
            print("\(i.teamName) получила бонус : +\(bonH) к здоровью и +\(bonD) к урону")
        }
        return result
    }
    
    func game(n: Int,teams:[Team]) -> Team {
        var teamsInGame = teams
        for _ in 1...n{
            teamsInGame = round(teams: teamsInGame)
            teamsInGame = bonus(teams: teamsInGame)
        }
        print("Одержал победу в войне \(teamsInGame[0].teamName)")
        return teamsInGame[0]
        
    }
}


//TEST
let N = 3

var NTeam = 1
for _ in 1...N {
    NTeam = NTeam*2
}

print(NTeam)

var players = [Player]()
for i in 1...(NTeam*4){
    players.append(Player(name: "Player\(i)", damage: Int.random(in: 0...100), helf: 100))
}

var teams = [Team]()
var xInPlayer = 0;

for i in 0..<NTeam {
    print("gg\(players[i])")
    teams.append(Team(name: "Team\(i)", pl1: players[i], pl2: players[i+1], pl3: players[i+2], pl4: players[i+3]))
    xInPlayer += 4
}

let game = Game()
let winner = game.game(n: 3, teams: teams)
