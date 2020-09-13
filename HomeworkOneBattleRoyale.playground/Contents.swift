class Hero {
    var healthPoint: Int
    var name: String
    var item: Int = 0
    var impactForce: Int
    
    init(name: String) {
        self.name = name
        healthPoint = 100
        impactForce = 12
    }
    
    func fight(with rival: Hero) {
        var damage = self.impactForce
        rival.healthPoint -= self.impactForce
        if item != 0 {
            rival.healthPoint -= 10
            item -= 1
            damage += 10
        }
        print("\(self.name) hit \(rival.name) Damage = \(damage) HealthPoint = \(rival.healthPoint)")
    }
    
    func amIAlive() -> Bool {
        if healthPoint > 0 {
            return true
        }
        return false
    }
}

class Magician: Hero {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        healthPoint = 85
        impactForce = 15
    }
}

class Tanker: Hero {
    override init(name: String) {
        super.init(name: name)
        self.name = name
        healthPoint = 150
        impactForce = 10
    }
}

class Team {
    var heroes: [Hero] = []
    var name: String
    
    init(name: String) {
        self.name = name
        heroes.append(Hero(name: "🧑‍🚀"))
        heroes.append(Tanker(name: "👨🏼‍🏭"))
        heroes.append(Magician(name: "🧙🏻‍♀️"))
        heroes.append(Hero(name: "👨‍🚀"))
    }
}

class Game {
    var teams: [Team] = []
    var numberOfRounds : Int = 1
    
    func prepare(n: Int) {
        var numberOfTeams = 1
        for _ in 0..<n {
            numberOfTeams *= 2
        }
        print("🧑‍🚀 - SuperWoman, 👨🏼‍🏭 - Tanker, 🧙🏻‍♀️ - Magician, 👨‍🚀 - SuperMan")
        print("---------------------------------------------------------")
        print("‼️Creating teams:")
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Team №\(i)"))
            print(teams.last!.name + " created ✅")
        }
        print("------------------------------")
    }
    
    func giveItems() {
        print("Start of distribution of items💎")
        let x = Int.random(in: 0..<20)
        for _ in 0...x {
            let team = teams[Int.random(in: 0..<teams.count)]
            let hero = team.heroes[Int.random(in: 0..<team.heroes.count)]
            hero.item += 1
            print(team.name + " got 1 item to " + hero.name)
        }
        print("-------------------------")
    }
    
    func roundPlay() {
        print("Staring of \(numberOfRounds) round! Good luck!")
        var teamsTemp = teams
        var result: [Team] = []
        for _ in 0..<(teams.count/2) {
            var helper = Int.random(in: 0..<teamsTemp.count)
            let teamOne = teamsTemp[helper]
            teamsTemp.remove(at: helper)
            helper = Int.random(in: 0..<teamsTemp.count)
            let teamTwo = teamsTemp[helper]
            teamsTemp.remove(at: helper)
            print("⚡️Fight between \(teamOne.name) and \(teamTwo.name)")
            result.append(fightBetweenTeams(first: teamOne, second: teamTwo))
            print("---------------------")
            print("\(result.last!.name) past round! With \(result.last!.heroes.count) heroes")
        }
        print("---------------------------------")
        self.teams = result
        numberOfRounds += 1
    }
    
    func fightBetweenTeams (first: Team, second: Team) -> Team {
        var count = 0
        var countHeroOfFirst = first.heroes.count
        var countHeroOfSecond = second.heroes.count
        while countHeroOfFirst != 0 && countHeroOfSecond != 0 {
            let one = Int.random(in: 0..<first.heroes.count)
            let two = Int.random(in: 0..<second.heroes.count)
            let heroOfFirst = first.heroes[one]
            let heroOfSecond = second.heroes[two]
            if count % 2 == 0 {
                heroOfFirst.fight(with: heroOfSecond)
                if heroOfSecond.amIAlive() == false {
                    print("\(heroOfSecond.name) of \(second.name) is dead 💀 <------")
                    second.heroes.remove(at: two)
                    countHeroOfSecond -= 1
                    if countHeroOfSecond == 0 {
                        print("\(second.name) lost the game")
                    }
                }
            } else {
                heroOfSecond.fight(with: heroOfFirst)
                if heroOfFirst.amIAlive() == false {
                    print("\(heroOfFirst.name) of \(first.name) is dead 💀 <------")
                    first.heroes.remove(at: one)
                    countHeroOfFirst -= 1
                    if countHeroOfFirst == 0 {
                        print("\(first.name) lost the game 🥺👉👈")
                    }
                }
            }
            count += 1
        }
        if first.heroes.count == 0 {
            return second
        }
        return first
    }
    
    func startGame(n: Int) {
        prepare(n: n)
        giveItems()
        while teams.count != 1 {
            roundPlay()
            if Int.random(in: 0...5) == 2 {
                giveItems()
            }
        }
        print("🎊\(teams.last!.name) WON THE GAME!🎊")
    }
}

//test
var game = Game()
game.startGame(n: 3)
