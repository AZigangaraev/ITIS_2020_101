protocol Developer{
    var workingPLace: String { get set }
    
    func coding()
    
    func drinkMilkShake()
}

class Human{
    var age: Int
    
    var sity: String
    
    init(age: Int, sity: String) {
        self.age = age
        self.sity = sity
    }
    
    func eating(){
        print("Nyum Nyum")
    }
}

class Albert: Human, Developer{
    
    var workingPLace: String
    
    init(age: Int, sity: String, workingPLace: String) {
        self.workingPLace = workingPLace
        super.init(age: age, sity: sity)
    }
    
    func coding() {
        print("I'm coding")
    }
    
    func drinkMilkShake() {
        print("I'm drinkking")
    }
    
}

var albert = Albert(age: 19, sity: "Kazan", workingPLace: "Apple.com")
albert.coding()
albert.eating()
albert.drinkMilkShake()
