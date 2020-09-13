class Teammate {
    var name: String
    var health = 12
    var damage = 5
    
    init(name: String) {
        self.name = name
    }
    
    func tryToHit(target: Teammate) -> Bool {
        if(Int.random(in: 0...9) > 4) {                                                 // Шанс попасть 50 на 50
            print(name + " ⚔ " + target.name + "! Current hp of \(target.name) is \(target.health - damage)!")
            target.health = target.health - self.damage
        } else {
            print(target.name + " dodged " + name + "'s attack!")
        }
        
        if (target.health < 1) {
            return true
        }
        
        return false
    }
    
    func isAlive() -> Bool{
        if (health < 1) {
            return false
        }
        return true
    }
}

class Team {
    var teammates: [Teammate] = []
    var name: String
    
    init(name: String) {
        self.name = name
        for i in 0...3 {
            let teammateName = self.name + "_member\(i+1)"
            teammates.append(Teammate.init(name: teammateName))
        }
    }
    
    func hasMembers() -> Bool {
        if teammates.count < 1 {
            return false
        }
        return true
    }
}

class Fight {
    
    static func startFight(teams: [Team]) -> [Int] {
        
        var defeatedTeamsIndexes: [Int] = []
        
        for i in 0...teams.count/2 - 1 {                                              // Берутся две крайние команды
            
            print("______" + teams[i].name + " VS " + teams[teams.count - i - 1].name + "______")
            
            if (fightBetweenTeams(firstTeam: teams[i], secondTeam: teams[teams.count - i - 1])){
                
                print(teams[teams.count - i - 1].name + " is out of the battle by \(teams[i].name)!")
                defeatedTeamsIndexes.append(teams.count - i - 1)
                
            } else {
                
                print(teams[i].name + " is out of the battle by \(teams[teams.count - i - 1].name)!")
                defeatedTeamsIndexes.append(i)
            }
            print()
        }
        return defeatedTeamsIndexes
    }
    
    private static func fightBetweenTeams(firstTeam: Team, secondTeam: Team) -> Bool {
        let firstTurn = Int.random(in: 0...1)                           // Рандомно выбирается команда, которая первой нанесёт удар
        if (firstTurn == 0){
            while(firstTeam.hasMembers() && secondTeam.hasMembers()) {
                
                let firstTeamMemberIndex = Int.random(in: 0...firstTeam.teammates.count-1)
                let secondTeamMemberIndex = Int.random(in: 0...secondTeam.teammates.count-1)
                
                let firstTeamMember = firstTeam.teammates[firstTeamMemberIndex]
                let secondTeamMember = secondTeam.teammates[secondTeamMemberIndex]
                
                if (firstTeamMember.tryToHit(target: secondTeamMember)) {
                    print(secondTeamMember.name + " is defeated!☠️")
                    secondTeam.teammates.remove(at: secondTeamMemberIndex)
                    
                } else {
                    
                    if (secondTeamMember.tryToHit(target: firstTeamMember)) {
                        print(firstTeamMember.name + " is defeated!☠️")
                        firstTeam.teammates.remove(at: firstTeamMemberIndex)
                    }
                }
            }
        } else {
            while(firstTeam.hasMembers() && secondTeam.hasMembers()) {
                
                let firstTeamMemberIndex = Int.random(in: 0...firstTeam.teammates.count-1)
                let secondTeamMemberIndex = Int.random(in: 0...secondTeam.teammates.count-1)
                
                let firstTeamMember = firstTeam.teammates[firstTeamMemberIndex]
                let secondTeamMember = secondTeam.teammates[secondTeamMemberIndex]
                
                if (secondTeamMember.tryToHit(target: firstTeamMember)) {
                    print(firstTeamMember.name + " is defeated!☠️")
                    firstTeam.teammates.remove(at: firstTeamMemberIndex)
                } else {
                
                    if (firstTeamMember.tryToHit(target: secondTeamMember)) {
                        print(secondTeamMember.name + " is defeated!☠️")
                        secondTeam.teammates.remove(at: secondTeamMemberIndex)
                    }
                    
                }
            }
        }
        
        if firstTeam.hasMembers(){
            return true
        }
        return false
    }
}

class Search {
    
    static func startSearching(teams: [Team]){
        for i in teams {
            let randomDecider = Int.random(in: 0...9)
            if (randomDecider < 6) {
                print(i.name + " found nothing 🙁")
            } else if (randomDecider < 8) {
                let someMember = i.teammates.randomElement()!                          // Выбирается тот, кто находит предмет
                let someValue = Int.random(in: 2...3)                                  // Слабые предметы усиляют на 2-3
                if (Int.random(in: 1...2) == 1) {                                      // 1 - предмет на урон, 2 - на лечение
                    print(someMember.name + "found a combat equipment. His attack is increased by \(someValue)!")
                    someMember.damage = someMember.damage + someValue
                    print("Now he has \(someMember.damage) damage!⚔️")
                } else {
                    print(someMember.name + "found some medicine. His attack is increased by \(someValue)!")
                    someMember.health = someMember.health + someValue
                    print("Now he has \(someMember.health) health points!💊")
                }
            } else {
                let someMember = i.teammates.randomElement()!
                let someValue = Int.random(in: 4...6)                                   // Сильные предметы усиляют на 4-6
                if (Int.random(in: 1...2) == 1) {
                    print(someMember.name + "found a high-quality weapon. His attack is increased by \(someValue)!")
                    someMember.damage = someMember.damage + someValue
                    print("Now he has \(someMember.damage) damage!⚔️")
                } else {
                    print(someMember.name + "found a first aid kit. His health is increased by \(someValue)!")
                    someMember.health = someMember.health + someValue
                    print("Now he has \(someMember.health) health points!💊")
                }
            }
            print()
        }
    }
    
}

class Game {
    var teams: [Team] = []
    
    func createTeams(n: Int) {
        for i in 0...2<<(n - 1) - 1 {
            let teamName = "Team\(i + 1)"
            teams.append(Team.init(name: teamName))
        }
    }
    
    func startGame() {
        while (teams.count > 1) {
            print("~~~~~~~~~~~~!Searching stage!~~~~~~~~~~~~")
            print()
            Search.startSearching(teams: teams)
            print("~~~~~~~~~~~~~~!Battle stage!~~~~~~~~~~~~")
            print()
            var toDeleteIndexes = Fight.startFight(teams: teams)
            toDeleteIndexes.sort(){$0 > $1}
            for i in toDeleteIndexes {
                teams.remove(at: i)
            }
        }
        print("👑" + teams[0].name.uppercased() + " IS A WINNER, CONGRATULATIONS👑")
    }
}

let game = Game()
game.createTeams(n: 3)
game.startGame()
var check = [1, 2, 3, 4, 5]
