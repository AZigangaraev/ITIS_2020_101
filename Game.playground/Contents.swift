protocol Calculator{
    func divedewithremainder(_ x: Int , by y : Int) -> (Int,Int)
    func fibonacci (n: Int) -> [Int]
    func sortByEvenOdd(array: [Int]) -> [Int]
    func trifonce( n:Int)
}
class Calculatordemo : Calculator{
    
    func divedewithremainder(_ x: Int, by y: Int) -> (Int, Int) {
        return ( x/x,x % y)
    }
    func fibonacci(n: Int) -> [Int] {
        switch n {
        case 0:
            return[]
            case 1:
            return[1]
        default:
            var arr:[Int] = []
            arr.append(1)
            arr.append(1)
            for a in 2..<n{
                arr.append(arr[a - 1] + arr[a - 2])
            }
            return arr
            
    }
    }
    func sortByEvenOdd(array: [Int]) -> [Int] {
        return array.sorted(by: {$0 % 2 == 1 && $1 % 2 == 0})
    }
    func trifonce(n: Int) {
        for a in 0..<n {
            for _ in a + 1..<2 * n {
                print(terminator:" ")
            }
            for _ in a...2 * a + a{
                print("▲", terminator:" ")
            }
            print()
        }
        for a in 0..<n {
            for _ in a..<n-1 {
                print(terminator:" ")
                
            }
            for _ in a...2 * a + a {
                print("▲", terminator:" ")
                
            }
            for _ in 2 * a..<2 * n - 1 {
                print(terminator:" ")
            }
            for _ in a...2 * a + a {
                print("▲",terminator:" ")
            }
            print()
        }
        
    }
}
protocol Person {
    var gender : String {get set}
var age: Int { get set }
var name: String { get set }

func eat()
func sleep()
}

class Student: Person {
var age: Int
var gender: String

var money: Int

var name: String

var averageScore: Double

func eat() {
if money > 50 {
print("I'm eating sandwich")
money -= 40
} else {
print("I don't have money to it lunch")
}
}

func sleep() {
print("\(name): I'm sleeping now")
}

func changemyName(newName: String) {
name = newName
}

init(age: Int, name: String, gender:String, money: Int, averageScore: Double) {
self.age = age
self.name = name
self.money = money
self.averageScore = averageScore
self.gender = gender
}
}

class HighClassStudent: Student {


override func eat() {
if money >= 150 {
print("I'm eating meat ")
money -= 120
} else {
    if money >= 50{
print("I 'm eating sandwi")
    }
    else {
        print("I don't have money to it lunch")
    }
}
}

func goPartywithfriends() {
if money > 300 {
print("I'm in club")
}else {
    if money > 150{
    print("I ' go to the cinema")
    }
    
else {
print("I don't have money")
}
}
    
    }}
