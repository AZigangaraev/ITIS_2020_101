import UIKit

protocol basicFunctionality {
    func printDataA()
    func printDataB()
}

class complexFunctionality1: basicFunctionality {
    func printDataA() {
        print("A")
    }
    
    func printDataB() {
        print("B")
    }
    
    private let secretValue = 12;
    
    func printSecretValue() {
        print(secretValue)
    }
    
    func complexFunctionalityMethod1() {
        print("Method 1")
    }
}

class complexFunctionality2: basicFunctionality {
    func printDataA() {
        print("Another kind of A")
    }
    
    func printDataB() {
        print("Another kind of B")
    }
    
    func complexFunctionalityMethod1() {
        print("Method 2")
    }
}

class InheritedClass: complexFunctionality1 {
    override init() {
        // Encapsulation doesn't access to private parameters
        
        // secretValue = 12
    }
    
    override func printDataA() {
        print("Overrided method of A")
    }
    
    override func printDataB() {
        print("Overrided method of B")
    }
}

// Inheritance allows using parents methods / values

let inheritedClass = InheritedClass()
inheritedClass.printDataA()
inheritedClass.complexFunctionalityMethod1()

// Polymorphism


let class1 = complexFunctionality1()
let class2 = complexFunctionality2()

let polymorphedClass: [basicFunctionality] = [class1, class2]

polymorphedClass.forEach { print($0) }

