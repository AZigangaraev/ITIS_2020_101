class Teacher: HasName {
    func sayName() -> String{
        return name
    }
    
    var name: String = ""
    func givingRating(to student: Student, give rating: Int) {
        student.rating = rating
    }
}

protocol HasName {
    var name: String { get set }
    func sayName() -> String
}

class Student: HasName{
    var name: String = ""
    var rating = 0
    
    func sayName() -> String {
        return name
    }
    
    func sayRating() -> Int {
        return rating
    }
}


var student = Student()
student.name = "Ivan"

student.sayName()

var techer = Teacher()
techer.name = "Marat"
techer.givingRating(to: student, give: 5)
techer.sayName()
student.sayRating()
