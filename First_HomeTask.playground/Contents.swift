import UIKit


class RoyalGame{
    let n:Int
    let teamsNumber:Int
    var teams = [Team]()
    
    init(n: Int, teams: [Team]) {
        self.n = n
        self.teamsNumber = Int(pow(2, Double(n)))
        self.teams = teams
    }
    
    func startGame(){
        
        //правила боя как в Heroes of Might and Magic V
        //те на рандоме выбирется какая команда начинает атаку, а потом участники двух команд чередуются
        var one = 0

        for i in 1...n{
            let firstTeam = one
            let secondTeam = one + 1
            fight(first: teams[firstTeam], second : teams[secondTeam], one: one)
            if (i != n){
                collectionOfResources()
            }
            if (one > teams.capacity - 1){
                one = 0
            }else{
                one += 2
            }
        }
        print("Победила команда " + teams[0].name)
    }
        
    private func collectionOfResources(){
        
        // во время сбора ресурсов на карте появляется один артефакт на увеличение урона и пять на восстановление уровня жизни

        for i in 1...6{
            let teamNumber = Int.random(in: 1...teamsNumber)
            let playerNumber = Int.random(in: 1...4)
            if (i == 1){
                let plusDamage = Int.random(in: 1...20)
                teams[teamNumber].players[playerNumber].attackDamage += plusDamage
                print(teams[teamNumber].players[playerNumber].name + " увеличил наносимый урон на \(plusDamage)")
            }else{
                let plusHp = Int.random(in: 1...30)
                teams[teamNumber].players[playerNumber].hp += plusHp
                print(teams[teamNumber].players[playerNumber].name + " восстановил hp на \(plusHp)")
            }
        }
    }
    
    private func fight(first: Team, second: Team, one: Int){
        
        // первый игрок из одной команды атакует первого из другой и тд
        
        var deadOne = 0
        var deadTwo = 0
        let firstAttaker = Int.random(in: 1...2)
        var nextPlayerFirst = 1
        var nextPlayerSecond = 1
        
        while(true){
            
            if(firstAttaker == 1){
                second.players[nextPlayerSecond].hp -= first.players[nextPlayerFirst].attackDamage
                if (second.players[nextPlayerSecond].hp <= 0){
                    deadTwo += 1
                    print("Игрок " + second.players[nextPlayerSecond].name + " был повержен ")
                    second.players[nextPlayerSecond] = second.players[second.players.capacity - 1]
                    second.players.remove(at: second.players.capacity - 1)
                    if (nextPlayerSecond > second.players.capacity - 1){
                        nextPlayerSecond = 1
                    }else{
                        nextPlayerSecond += 1
                    }
                }
                first.players[nextPlayerFirst].hp -= second.players[nextPlayerSecond].attackDamage
                if (first.players[nextPlayerFirst].hp <= 0){
                    deadOne += 1
                    print("Игрок " + first.players[nextPlayerFirst].name + " был повержен ")
                    first.players[nextPlayerFirst] = first.players[first.players.capacity - 1]
                    first.players.remove(at: first.players.capacity - 1)
                    if (nextPlayerFirst > first.players.capacity - 1){
                        nextPlayerFirst = 1
                    }else{
                        nextPlayerFirst += 1
                    }
                }
            }
            if(firstAttaker == 2){
                
                first.players[nextPlayerFirst].hp -= second.players[nextPlayerSecond].attackDamage
                if (first.players[nextPlayerFirst].hp <= 0){
                    deadOne += 1
                    print("Игрок " + first.players[nextPlayerFirst].name + " был повержен ")
                    first.players[nextPlayerFirst] = first.players[first.players.capacity - 1]
                    first.players.remove(at: first.players.capacity - 1)
                    if (nextPlayerFirst > first.players.capacity - 1){
                        nextPlayerFirst = 1
                    }else{
                        nextPlayerFirst += 1
                    }
                }
                second.players[nextPlayerSecond].hp -= first.players[nextPlayerFirst].attackDamage
                if (second.players[nextPlayerSecond].hp <= 0){
                    deadTwo += 1
                    print("Игрок " + second.players[nextPlayerSecond].name + " был повержен")
                    second.players[nextPlayerSecond] = second.players[second.players.capacity - 1]
                    second.players.remove(at: second.players.capacity - 1)
                    if (nextPlayerSecond > second.players.capacity - 1){
                        nextPlayerSecond = 1
                    }else{
                        nextPlayerSecond += 1
                    }
                }
                    
            }
            nextPlayerFirst += 1
            nextPlayerSecond += 1
            
            if (nextPlayerFirst > first.players.capacity - 1){
                if (deadOne == first.players.capacity){
                    print("Команда " + second.name + " победила команду " + first.name)
                    teams[one] = teams[teams.capacity - 1]
                    teams.remove(at: teams.capacity - 1)
                    break
                }else{
                    nextPlayerFirst = 1
                }
            }
            if (nextPlayerSecond > second.players.capacity - 1){
                if (deadTwo == second.players.capacity){
                    print("Команда " + first.name + " победила команду " + second.name)
                    teams[one + 1] = teams[teams.capacity - 1]
                    teams.remove(at: teams.capacity - 1)
                    break
                }else{
                    nextPlayerSecond = 1
                }
            }
        }
    }
}

class Participant{
    let name:String
    var attackDamage:Int
    var hp:Int
    
    init(name:String, attackDamage:Int, hp:Int) {
        self.name = name
        self.attackDamage = attackDamage
        self.hp = hp
    }
}

class Team{
    let name:String
    var players = [Participant]()
    
    init(name:String, par1:Participant, par2:Participant, par3:Participant, par4: Participant) {
        self.name = name
        players.append(par1)
        players.append(par2)
        players.append(par3)
        players.append(par4)
    }
}

var par1 = Participant(name: "Vova", attackDamage: 5, hp: 60)
var par2 = Participant(name: "Dima", attackDamage: 7, hp: 10)
var par3 = Participant(name: "Olya", attackDamage: 8, hp: 30)
var par4 = Participant(name: "Zoya", attackDamage: 4, hp: 15)

var par5 = Participant(name: "Sasha", attackDamage: 4, hp: 30)
var par6 = Participant(name: "Evelina", attackDamage: 6, hp: 20)
var par7 = Participant(name: "Lina", attackDamage: 10, hp: 5)
var par8 = Participant(name: "Alina", attackDamage: 5, hp: 25)

var team1 = Team(name: "The best", par1: par1, par2: par2, par3: par3, par4: par4)
var team2 = Team(name: "Avocado", par1: par5, par2: par6, par3: par7, par4: par8)

var twoTeams = [team1, team2]

var game  = RoyalGame(n: 1,teams: twoTeams)

game.startGame()
