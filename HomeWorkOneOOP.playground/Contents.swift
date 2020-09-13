
protocol Person {
    
    var age: Int { get set }
    var name: String { get set }
    
    func eat()
    func sleep()
}

class Student: Person {
    var age: Int
    
    var money: Int
    
    var name: String
    
    var averageScore: Double
    
    func eat() {
        if money >= 10 {
            print("I'm eating now")
            money -= 10
        } else {
            print("I don't have money")
        }
    }
    
    func sleep() {
        print("\(name): I'm sleeping now")
    }
    
    func changeName(newName: String) {
        name = newName
    }
    
    init(age: Int, name: String, money: Int, averageScore: Double) {
        self.age = age
        self.name = name
        self.money = money
        self.averageScore = averageScore
    }
}

class RichStudent: Student {
    
    //переопределенный метод 
    override  func eat() {
           if money >= 100 {
               print("I'm eating now")
               money -= 100
           } else {
               print("I don't have money")
           }
       }
    
    func goToTheTheater() {
        if money > 150 {
            print("I'm in theater")
        } else {
            print("I don't have money")
        }
    }
    
    override func sleep() {
        super.sleep()
        //просто для примера
        print("Check")
    }
}

var me = Student(age: 19, name: "Nikita", money: 100, averageScore: 91.5)
var alex = RichStudent(age: 19, name: "Alex", money: 15000, averageScore: 80.2)

var examplePerson: Person = me
var examplePerson2: Person = alex

examplePerson.sleep()
examplePerson2.sleep()

var exampleStudent: Student = alex
exampleStudent.sleep()

