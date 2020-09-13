//: [Previous](@previous)

import Foundation

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

class CalculatorImplementation: Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var curNumber = 1;
        var res: [Int] = [0]
        
        guard n > 0 else {
            return res;
        }
        
        for i in 1..<n {
            res.append(curNumber)
            curNumber += res[i-1]
        }
        
        return res;
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        return array.sorted(by: {
            return $0 % 2 != 0 && $1 % 2 == 0
        })
    }
    
    func triforce(n: Int) {
        var spaces = n - 1
        var triangles = 1
        
        for _ in 0..<n  {
            var line: String = ""
            
            for _ in 0..<spaces {
                line.append(" ")
            }
            
            for _ in 0..<triangles {
                line.append("▲ ")
            }
            
            print(line)
            
            spaces -= 1;
            triangles += 1;
        }
    }
}

var calc = CalculatorImplementation.init();

print(calc.divideWithRemainder(55, by: 6))

print(calc.fibonacci(n: 21))

print(calc.sortByEvenOdd(array: [0,4,2,5,8,6,2,4,6,2,2,3,7,6,78,6,3,2,43,6,45]))

calc.triforce(n: 5)
