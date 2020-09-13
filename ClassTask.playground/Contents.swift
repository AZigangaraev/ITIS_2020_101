import UIKit
// задание на практику
class Figure{
    var color:String
    var type:String
    var area:Float
    private var isFigure = true
    
    init(color: String, type: String, area: Float) {
        self.color = color
        self.type = type
        self.area = area
    }
    
    func printAmountOfSides() {
        print("Amount of sides are")
    }
    
    func IsThatFigure() -> Bool{
        return isFigure
    }
}

class Triangle: Figure {
    
    var heigth:Int
    
    init(heigth: Int, color: String, area: Float) {
        self.heigth = heigth
        super.init(color : color, type: "triangle", area: area)
    }
    
    override func printAmountOfSides() {
        print("Amount of sides are \(3)")
    }
}

class Circle: Figure {
    
    var radius:Int
    
    init(radius: Int, color: String, area: Float) {
        self.radius = radius
        super.init(color : color, type: "circle", area: area)
    }
    
    override func printAmountOfSides() {
        print("Amount of sides are \(0)")
    }

}

protocol Calculator {
    /// Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    /// Функция должна вернуть массив `n` чисел Фибоначчи. (Числа 1, 1, 2, 3, 5, 8 и т.д.)
    func fibonacci(n: Int) -> [Int]
    /// Функция должна сортировать массив таким образом, чтобы в начале массива были нечётные числа, а в конце — чётные. Сортировать сами числа внутри чётных-нечётных необязательно.
    func sortByEvenOdd(array: [Int]) -> [Int]
    /// Функция должна напечатать triforce знаками "▲" и " " функцией `print`.
    /// - parameter n: Высота triforce.
    func triforce(n: Int)
}

class ClassForCalculator: Calculator{

    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x/y,x%y)
    }

    func fibonacci(n: Int) -> [Int] {

        var arrayOfFibonacci = [Int]()
        var index = 2
        
        if (n > 0){
            arrayOfFibonacci.append(1)}
        
        if (n > 1){
            arrayOfFibonacci.append(1)}
        
        if (n > 2){
            
            while index + 1 <= n {
                arrayOfFibonacci.append(arrayOfFibonacci[index - 1] + arrayOfFibonacci[index - 2])
            index += 1
            }
        }
        return arrayOfFibonacci
    }

    func sortByEvenOdd(array: [Int]) -> [Int] {
        var newArray = array
        var indexOdd = 0
        var indexEven = array.count - 1
        
        while (indexOdd != indexEven){
            
            if (newArray[indexOdd] % 2 == 0){
                let element = newArray[indexOdd]
                newArray[indexOdd] = newArray[indexEven]
                newArray[indexEven] = element
                indexEven -= 1
                
            }else{
                indexOdd += 1
            }
        }
        return newArray
    }

    func triforce(n: Int) {
        var h = 1
        
        while h <= n{
            if (h != n){
                for _ in 1...n-h{
                    print(" ", terminator: "")
                }
            }
            for _ in 1...h{
                print("▲", terminator: "")
                print(" ", terminator: "")
            }
            h += 1
            print("")
        }
    }
}









