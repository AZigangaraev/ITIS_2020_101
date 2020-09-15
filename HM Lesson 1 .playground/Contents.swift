class Warrior {
    var hp : Int
    var name :String
    var item : Int = 0
    var damage : Int
    
    init(name: String) {
        self.name = name
        hp = 100
        damage = 8
    }
    func fight(with rival:Warrior){
        var Damage = self.damage
        rival.hp -= self.damage
        if item != 0
        {
            rival.hp -= 15
            item -= 1
            damage += 7
        }
        print("\(self.name) impact \(rival.name) damage = \(Damage) hp = \(rival.hp)")
    }
    func alive() -> Bool
    {
        if hp > 0
        {
            return true
        }
        return false
    }
}
class Team {
    var warroiries: [Warrior] = []
    var name : String
    
    init (name: String)
    {
        self.name = name
        warroiries.append(Warrior(name: "Diman"))
        warroiries.append(Warrior(name: "Vadim"))
        warroiries.append(Warrior(name: "Sasha"))
        warroiries.append(Warrior(name: "Vovan"))
    }
    
}

class Game {
    var teams : [Team] = []
    var nofr : Int = 1
    
    
    func fight(first : Team , second: Team) -> Team
    {
        var count = 0
        var countwarroir1 = first.warroiries.count
        var countwarroir2 = second.warroiries.count
        while countwarroir1 != 0 && countwarroir2 != 0 {
            var one = Int.random(in: 0..<first.warroiries.count)
            var two = Int.random(in: 0..<first.warroiries.count)
            var warrior1 = first.warroiries[one]
            var warrior2 = second.warroiries[two]
            if count % 2 == 0
            {
                warrior1.fight(with: warrior2)
                if warrior2.alive() == false
                {
                    print ("\(warrior2.name) of \(second.name) was die  ")
                    second.warroiries.remove(at: two)
                    countwarroir2 -= 1
                    if countwarroir2 == 0
                    {
                        print ("Game over for \(second.name)")
                    }
                }
                
            }
            else
            {
                warrior2.fight(with: warrior1)
                if warrior1.alive() == false
                {
                    print("\(warrior1.name) of \(first.name) was die  ")
                    first.warroiries.remove(at: one)
                    countwarroir1 -= 1
                    if countwarroir1 == 0
                    {
                        print ("Game over for \(first.name)")
                    }
                }
            }
            count += 1
            
        }
        if first.warroiries.count == 0
        {
            return second
        }
        return first
    }
    func round()
    {
        print("Round \(nofr) To the War!!!!!!!")
        var result :[ Team] = []
        var teamsh = teams
        for _ in 0..<(teams.count/2)
        {
            var help = Int.random(in: 0..<teamsh.count)
            var team1 = teamsh[help]
            teamsh.remove(at: help)
            help = Int.random(in: 0..<teamsh.count)
            var team2 = teamsh[help]
            teamsh.remove(at: help)
            print("\(team1) vs \(team2)")
            result.append(fight(first : team1, second : team2))
            print("............................")
            print ("\(result.last!.name) continue . command structure \(result.last!.warroiries.count) ")
            
        }
        print("............................")
        self.teams = result
        nofr += 1
        
        
    }
    func gitems(){
        var num = Int.random(in: 0..<20)
        for _ in 0...num
        {
            let team = teams[Int.random(in: 0..<teams.count)]
            let warrior = team.warroiries[Int.random(in: 0..<team.warroiries.count)]
            warrior.item += 1
            
            
        }
        print (".............................................")
    }
    func start(a:Int)
    {
        prepare(n: a)
        gitems()
        while teams.count != 1 {
            round()
            if Int.random(in: 0...5) == 2
            {
                gitems()
            }
        }
        print("Ladys and Gentalman . We have a winner . And his name is .........\(teams.last!.name) . No this is John Cena")
    }
    
    func prepare(n: Int)
    {
        var noft = 1
        for _ in 0 ..< n
        {
            noft *= 2
        }
        print ("Creat ur teams")
        for a in 1...noft
        {
            teams.append(Team(name: "Team number: \(a)"))
            print(teams.last!.name + "created , man ")
        }
        print("........................................................................................")
    }
}
var game = Game()
game.start(a: 3)
