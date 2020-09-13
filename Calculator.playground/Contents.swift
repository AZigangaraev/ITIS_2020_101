import UIKit

protocol Calculatable {
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

class Calculator: Calculatable {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let firstValue: Int = x / y
        let secondValue: Int = x % y
        return(firstValue, secondValue)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var result = [Int]()
        
        guard n > 0 else {
            return result
        }
        
        result.append(1)
        var headValue = 1
        var tailValue = 0
        
        for _ in 1..<n {
            let sum = headValue + tailValue
            result.append(sum)
            tailValue = headValue
            headValue = sum
        }
        
        return result
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        let odd = array.filter{$0 % 2 != 0}
        let even = array.filter{$0 % 2 == 0}
        return odd + even
    }
    
    func triforce(n: Int) {
        let triangle = "▲"
        var triangleIndex = 1
        var rowIndex = 1
        
        while rowIndex <= n {
            
            var str = ""
            var space = n
            
            while space > rowIndex {
                str += " "
                space -= 1
            }
            
            var x = 1
            
            while x <= triangleIndex {
                str += triangle
                x += 1
            }
            
            rowIndex += 1
            triangleIndex += 2
            print(str)
            str = ""
        }
    }
}

let calculator = Calculator()

calculator.divideWithRemainder(20, by: 3)
let arr = calculator.fibonacci(n: 6)
calculator.sortByEvenOdd(array: arr)
calculator.triforce(n: 7)
