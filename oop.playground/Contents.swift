import UIKit

protocol Human {
    func read()
    func eat()
    func sleep()
}

class Student: Human {
    
    private let id = Int.random(in: 1...1000)
    
    let name: String
    var course: Int
    var age: Int
    var money: Int?
    
    enum preferedFood: String {
        case apple = "Apple"
        case meat = "Meat"
        case bread = "Bread"
    }
    
    init(name: String, age: Int, course: Int, money: Int? = nil) {
        self.name = name
        self.age = age
        self.course = course
        self.money = money
    }
    
    func read() {
        print("I'm reading")
    }
    
    func eat() {
        print("I'm eating \(preferedFood.apple)")
    }
    
    func sleep() {
        print("I'm eating")
    }
    
    func printLastDigitOfId() {
        let digit = id % 10
        print(digit)
    }
    
    func hasSomeMoney() {
        guard let money = money else {
            print("I haven't some money")
            return
        }
        
        print("I have \(money) coins")
    }
}

protocol Super {
    func superAction(withBattleCry cry: String)
}

class SuperStudent: Student, Super {
    
    func superAction(withBattleCry cry: String) {
        print("\(name): \(cry)")
    }
    
    override func hasSomeMoney() {
        super.hasSomeMoney()
        print("But it's not your business")
    }
}

let firstStudent = Student(name: "Ivan", age: 19, course: 2)
firstStudent.hasSomeMoney()

let secondStudent = Student(name: "Alice", age: 20, course: 2, money: 20)
secondStudent.hasSomeMoney()

let thirdStudent = SuperStudent(name: "Mike", age: 21, course: 3, money: 24)
thirdStudent.hasSomeMoney()
thirdStudent.superAction(withBattleCry: "AAAAAARRRR")



