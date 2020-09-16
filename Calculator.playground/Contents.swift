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

class AdoRed: Calculator {

    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
    }

     func fibonacci(n: Int) -> [Int] {
        if n <= 0 { return [] }
        else if n == 1 { return [1] }
        var array = [1, 1]
        for i in 2..<n {
            array.append(array[i - 1] + array[i - 2])
            
        }
        return array
    }

    func sortByEvenOdd(array: [Int]) -> [Int] {
        var arr1 = [Int]()
        var arr2 = [Int]()
        for n in array {
            n % 2 == 0 ? arr1.append(n) : arr2.append(n)
        }
        return arr1 + arr2
    }

    func triforce(n: Int) {
    for i in 0..<n {
        for _ in i + 1..<2 * n {
            print(terminator:" ")
        }
        for _ in i...2 * i + i {
            print("▲", terminator:"")
        }
        print()
    }
    for i in 0..<n {
        for _ in i..<n - 1 {
            print(terminator:" ")
        }
        for _ in i...2 * i + i {
            print("▲", terminator:"")
        }
        for _ in 2 * i..<2 * n - 1 {
            print(terminator:" ")
        }
        for _ in i...2 * i + i {
            print("▲", terminator:"")
        }
        print()
        
        }
    }
}

var calculator = AdoRed()
print(calculator.divideWithRemainder(99, by: 99))

var AdoRedArray1 = calculator.fibonacci(n: 5)
print(AdoRedArray1)

let AdoredArray2 = [30, 40, 50, 60, 1, 1]
print(calculator.sortByEvenOdd(array: AdoredArray2))

calculator.triforce(n: 4)
