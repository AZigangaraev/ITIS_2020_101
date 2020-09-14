class Player {
    var HP: Int
    var name: String
    var item: Int
    var dmg: Int

    init(name: String) {
        self.name = name
        HP = 100
        dmg = 20
        item = 0
    }
    func AreUStillInGame() -> Bool {
        if HP > 0 {
            return true
        }
        return false
    }
    func fight(enemy: Player) {
        var damage = self.dmg
        enemy.HP -= self.dmg
        if item != 0 {
            if item == 1 {
                print("He found a longbow!")
                enemy.HP -= 15
                item -= 1
                damage += 15
            }
            if item == 2 {
                print("He found a medkit")
                HP += 15
            }
            if item == 3 {
                print("He found a Hercules elixir")
                enemy.HP -= 50
                HP += 50
                damage += 50
            }
        }
        print(self.name + "hit" + enemy.name)
    }
}

class Support: Player {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        HP = 70
        dmg = 25
    }
}

class BigBoy: Player {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        HP = 200
        dmg = 15
    }
}
class Assasin: Player {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        HP = 80
        dmg = 45
    }
}

class Team {
    var survivor: [Player] = []
    var name: String

    init(name: String) {
        self.name = name
        survivor.append(Player(name: "DefaultGuy"))
        survivor.append(Assasin(name: "Supakilla"))
        survivor.append(BigBoy(name: "Machine"))
        survivor.append(Support(name: "Can i help u?"))
    }
}

class Game {
    var teams: [Team] = []
    var Round : Int = 1

    func TeamCreate(n: Int) {
        var numberOfTeams = 1
        for _ in 0..<n {
            numberOfTeams *= 2
        }
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Team\(i)"))
        }
    }
    func FightRound() {
        print("Round \(Round) is coming!")
        var CurrentTeamsFight = teams
        var result: [Team] = []
        for _ in 0..<(teams.count/2) {
            var number = Int.random(in: 0..<CurrentTeamsFight.count)
            let TeamOne = CurrentTeamsFight[number]
            CurrentTeamsFight.remove(at: number)
            number = Int.random(in: 0..<CurrentTeamsFight.count)
            let TeamTwo = CurrentTeamsFight[number]
            CurrentTeamsFight.remove(at: number)
            print(TeamOne.name + "and" + TeamTwo.name + "came for a fight!")
            result.append(FightBetweenTeams(first: TeamOne, second: TeamTwo))
            print(result.last!.name + "survived!")
        }
        self.teams = result
        Round += 1
    }
    func FightBetweenTeams (first: Team, second: Team) -> Team {
           var Number = 0
           var Number1 = first.survivor.count
           var Number2 = second.survivor.count
           while Number1 != 0 && Number2 != 0 {
               let one = Int.random(in: 0..<first.survivor.count)
               let two = Int.random(in: 0..<second.survivor.count)
               let FirstFighter = first.survivor[one]
               let SecondFighter = second.survivor[two]
               if Number % 2 == 0 {
                FirstFighter.fight(enemy: SecondFighter)
                   if SecondFighter.AreUStillInGame() == false {
                       print((SecondFighter.name) + "killed")
                       second.survivor.remove(at: two)
                       Number2 -= 1
                       if Number2 == 0 {
                           print((second.name) + "wiped off")
                       }
                   }
               } else {
                SecondFighter.fight(enemy:FirstFighter)
                   if FirstFighter.AreUStillInGame() == false {
                       print((SecondFighter.name) + "killed")
                       first.survivor.remove(at: one)
                       Number1 -= 1
                       if Number1 == 0 {
                           print((first.name) + "wiped off")
                       }
                   }
               }
               Number += 1
           }
           if first.survivor.count == 0 {
               return second
           }
           return first
       }

    func LootTime() {
        print("Got some time for loot")
        let x = Int.random(in: 0..<10)
        for _ in 0...x {
            let team = teams[Int.random(in: 0..<teams.count)]
            let char = team.survivor[Int.random(in: 0..<team.survivor.count)]
            char.item += 1
            print(team.name + char.name + " got lot of luck!" )
        }
    }
    func StartGame() {
        TeamCreate(n: 4)
        while teams.count > 1 {
            FightRound()
            LootTime()
        }
        print((teams.last!.name) + "CHICKEN CHICKEN WINNER DINNER")
    }
}

var game = Game()
game.StartGame()
