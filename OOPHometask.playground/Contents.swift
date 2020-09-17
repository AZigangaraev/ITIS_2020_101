//KAMALIEV EMIL 11-901
import UIKit
//Task2

fileprivate class Form {
    internal var name: String
    internal var length: Int
    internal var width: Int
    
    init(name:String,length: Int, width: Int) {
        self.name = name
        self.length = length
        self.width = width
    }
    
    func printInformationAboutForm(){
        print("Имя: \(self.name)  Длина: \(self.length)  Ширина: \(self.width)")
    }
    
    func countingSquare() -> Int {
        return self.length * self.width
    }
    
    func countingPerimeter() -> Int {
        return (self.length + self.width) * 2;
    }
    

    func countingSumOfOppositeSides() -> Int {
        return self.length + self.width
    }
    
}


fileprivate class Form3D: Form {
    private var height: Int
    init(name: String,length: Int, width: Int, height: Int) {
            self.height = height
        super.init(name: name, length: length, width: width)
        }
        
    override func printInformationAboutForm(){
        print("Имя: \(self.name)  Длина: \(self.length)  Ширина: \(width)  Высота: \(self.height)")
    }
    
    func countingVolume() -> Int {
        return self.length * self.width * self.height
    }
}

//main
fileprivate let form = Form.init(name: "Square",length: 15, width: 15)
form.countingSumOfOppositeSides()
form.printInformationAboutForm()
form.countingPerimeter()
form.countingSquare()

fileprivate let form2 = Form3D.init(name: "Something", length: 25, width: 35, height: 45)

form2.countingVolume()
form2.printInformationAboutForm()





//Task1

protocol Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    func fibonacci(n: Int) -> [Int]
    func sortByEvenOdd(array: [Int]) -> [Int]
    func triforce(n: Int)
}


class RealiseOfCalculator: Calculator {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        
        let resultdiv = x / y
        let resultmod = x % y
        
        return (resultdiv,resultmod)

    }
    
    func fibonacci(n: Int) -> [Int] {
        
        var array: Array <Int> = []
        array.append(1)
        array.append(1)
        
        if (n == 0) {
            return []
        }
        else if (n == 1) {
            return [1]
        } else {
            
            for i in 2..<n {
                array.append(array[i - 1] + array[i - 2])
            }
            return array
            
        }
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var array1: Array<Int> = []
        var array2: Array<Int> = []
        
        for i in array {
            if (i % 2 == 0) {
                array1.append(i)
            } else {
                array2.append(i)
            }
        }
        return array1 + array2
    
    }
    
    func triforce(n: Int) {
        var m: Int = 0
        var k: Int = 0
        var i: Int = 1
        
        while k < n {
                
            while i < 2 * n - k {
                print(" ")
                i += 1
                
            }
            
            while i < 1 + m {
                print("▲")
                i += 1
            }
            
            m += 2
            print("\n")
            k += 1
            
        }
        
        m = 0
        i = 0
        k = 0
        
        while k < n {
            while i < n - k - 1 {
                print(" ");
                i += 1
            }
            
            while i < k + m + 1 {
                print("▲")
                i += 1
                
            }
            
            while i < 2 * n - 1 - 2 * m {
                print(" ")
                i += 1
            }
            
            while i < k + m + 1 {
                print("▲")
                
            }
            
            m += 1
            k += 1
            
            print("\n")
        }
        
        
    }
    
}

var check = RealiseOfCalculator()

var array: Array<Int> = [3,6,33,17,2,8,12]
check.divideWithRemainder(5, by: 3);
check.fibonacci(n: 9)
print(check.triforce(n: 6));
print(check.sortByEvenOdd(array: [3,6,33,17,2,8,12]));


















