import UIKit

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

class AlbaCalculator: Calculator {

    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }

     func fibonacci(n: Int) -> [Int] {
        if n <= 0 { return [] }
        else if n == 1 { return [1] }
        var f = [1, 1]
        for i in 2..<n { f.append(f[i - 1] + f[i - 2]) }
        return f
    }

    func sortByEvenOdd(array: [Int]) -> [Int] {
        var a = [Int]()
        var b = [Int]()
        for num in array {
            num % 2 == 0 ? a.append(num) : b.append(num)
        }
        return a+b
    }

    func triforce(n: Int) {
        let columns = 4 * n - 1
        let center = columns / 2 + 1
        for i in 1...n {
            for j in 1...columns {
                print(j > center - i && j < center + i ? "▲" : " ", terminator: "")
            }
            print()
        }
        for i in 1...n {
            for _ in 1...2 {
                for j in 1...center {
                    print(j > n - i && j < n + i ? "▲" : " ", terminator: "")
                }
            }
            print()
        }
    }
}

var calculator = AlbaCalculator()
print(calculator.divideWithRemainder(15, by: 2))

var fibArr = calculator.fibonacci(n: 11)
print(fibArr)

let array = [10, 3, 4, 1, 6, 9, 19, 20, 21, 1, 23]
var result = calculator.sortByEvenOdd(array: array)

print(result)
calculator.triforce(n: 7)



