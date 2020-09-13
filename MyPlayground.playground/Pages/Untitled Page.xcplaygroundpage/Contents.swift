protocol MakingSounds {
    func makeSound()
}

class Animal: MakingSounds {
    private let identifer: Int = Int.random(in: 1...10000)
    
    internal func makeSound() {
        print("<Silence>")
    }
    
    func printDescription() {
        print("Animal \(identifer)")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Bark!")
    }
    
    func makeBeep() {
        print("Beep 2")
    }
}

extension MakingSounds {
    func makeBeep() {
        print("Beep!")
    }
}

class RubberDuck: MakingSounds {
    func makeSound() {
        print("Quack")
    }
}

class Toy: MakingSounds {
    func makeSound() {
        print("Brrrr")
    }
}

let dog = Dog()
let animal: MakingSounds = Dog()
dog.makeBeep()
let beepArray = [dog, animal]
for beep in beepArray {
    beep.makeBeep()
}

let duck = RubberDuck()

let array: [Any] = [dog, animal, duck, 1, 2, 3, 4]
var sum = 0
for element in array {
    if let makingSound = element as? MakingSounds {
        makingSound.makeSound()
    } else if let int = element as? Int {
        sum += int
    }
}
print(sum)

class Square {
    var length: Int = 0
}

protocol SquareSize {
    func printSquareSize()
}

let square = Square()
square.length = 5

extension Square: SquareSize {
    func printSquareSize() {
        print("\(length * length)")
    }
}

square.printSquareSize()

protocol HasName {
    var name: String { get set }
}

class Human: HasName {
    var name: String = ""
}

var human: HasName = Human()
human.name = "Ivan"

class HumanClass: HasName {
    var name: String = ""
}

struct HumanStruct: HasName {
    var name: String = ""
    
    mutating func changeName() {
        name = "Ivan"
    }
}

let intRand = Int.random(in: 1...5)

class ClassWithInit {
    var x: Int
    var y: Int
    var z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}

var h1 = HumanStruct()
h1.changeName()

enum ItemQuality {
    case epic
    case normal
    case rare
}

let quality: ItemQuality = .epic

let classValue = HumanClass()
let structValue = HumanStruct()
classValue.name = "Ivan"
structValue.name = "Ivan"
