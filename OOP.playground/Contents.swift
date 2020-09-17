protocol Playable {
    func play()
}

class Game: Playable {
    
    func play() {
        print(self.name, self.complexity)
    }
    
    var name: String
    private var complexity: Int
    
    init(name: String, complexity: Int){
        self.name = name
        self.complexity = complexity
    }
    
    func getComplexity() -> Float {
        return Float(self.complexity)
    }
    
    func like() {
        
    }
    
    
}

class AppStore: Game {
    var Designer: String
    var year: Int
    var country: String
    var developer: String
    init(name: String, complexity: Int, designer: String, year: Int, country: String, developer: String) {
        self.Designer = designer
        self.year = year
        self.country = country
        self.developer = developer
        super.init(name: name, complexity: complexity)
    }
    override func play() {
        print("Оформил дизайн:", self.Designer, "Игра:", self.name,"Год:", self.year, "Место:", self.country, "Разработчик:", self.developer)
    }
    
    
}

class Selection: Playable {
    func play() {
        print(self.name, self.year)
        for game in Games{
            game.play()
        }
    }
    private var Games: [AppStore] = []
    var name: String
    var year: Int
    
    func add(game: AppStore){
        Games.append(game)
    }
    
    func deleteByIndex(index: Int){
        Games.remove(at: index)
    }
    
    func shuffle()
    {
        Games.shuffle()
    }
    
    init(name: String, year: Int)
    {
        self.name = name
        self.year = year
    }
    
    
}

let game1 = Selection(name: "Angry birds", year: 2013)

let f2 = AppStore(name: "Clash roal", complexity: 7, designer: "Nikita", year: 2018, country: "Russia", developer: "Pasha")

let f = AppStore(name: "Gost", complexity: 3, designer: "Jon", year: 2012, country: "Russia", developer: "Anton")

let f3 = AppStore(name: "Nan", complexity: 2, designer: "Kirill", year: 2020, country: "Russia", developer: "Tom")

game1.add(game: f)
game1.add(game:f2)
game1.add(game: f3)
game1.shuffle()
game1.play()





//s.play()
//print(s.getDurationInMin())



