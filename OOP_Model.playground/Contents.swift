class Hostel {
    var mayor: Employee
    var numberOfResidents: Int
    var numberOfEmployees: Int
    var houses: [House]
    
    init(mayor: Employee, numberOfResidents: Int, numberOfEmployees: Int, houses: [House]) {
        self.mayor = mayor
        self.numberOfResidents = numberOfResidents
        self.numberOfEmployees = numberOfEmployees
        self.houses = houses
    }
}

class House {
    var commandant: Employee
    var numberOfResidents: Int
    var numberOfEmployees: Int
    
    init(commandant: Employee, numberOfResidents: Int, numberOfEmployees: Int) {
        self.commandant = commandant
        self.numberOfResidents = numberOfResidents
        self.numberOfEmployees = numberOfEmployees
    }
    
    func populatePeople(count: Int){
        numberOfResidents = numberOfResidents + count
    }
    
    func evictPeople(count: Int){
        if (count <= numberOfResidents) {
            numberOfResidents = numberOfResidents - count
        } else {
            print("Error")
        }
    }
}

class Human {
    let name: String
    var age: Int
    
    func toEat() {
        print("Eating")
    }
    
    func toThink() {
        print("Thinking")
    }
    
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

class Student: Human {                                          // Наследование
    override func toThink() {                                   // Полиморфизм
        print("Thinking like a student(slyly)")
    }
    
    func toLearn() {
        print("Learning")
    }
}

class Employee: Human {                                         // Наследование
    func toWork(){
        print("Working")
    }
    
    func printTimeForLunch(){
        let timeForLunch = getTimeForLunch()
        print("\(timeForLunch):00 - \(timeForLunch + 1):00")
    }
    
    private func getTimeForLunch() -> Int {                     // Инкапcуляция
        return Int.random(in: 8...16)
    }
}
