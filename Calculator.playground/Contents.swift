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

class MyCalculator: Calculator {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        if n <= 0 { return [] }
        else if n == 1 { return [1] }
        var fib = [1, 1]
        for i in 2..<n { fib.append(fib[i - 1] + fib[i - 2]) }
        return fib
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var even = [Int](), odd = [Int]()
        for num in array {
            num % 2 == 0 ? even.append(num) : odd.append(num)
        }
        return odd + even
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

// MARK: - TEST

let myCalc = MyCalculator()

myCalc.divideWithRemainder(14, by: 5)
myCalc.divideWithRemainder(36, by: 6)
myCalc.divideWithRemainder(183, by: 15)

myCalc.fibonacci(n: -2)
myCalc.fibonacci(n: 0)
myCalc.fibonacci(n: 1)
myCalc.fibonacci(n: 2)
myCalc.fibonacci(n: 5)
myCalc.fibonacci(n: 8)

myCalc.sortByEvenOdd(array: [1, 2, 3, 4, 5, 6, 7, 8, 9])
myCalc.sortByEvenOdd(array: [30, 75, 46, -45, 59, -97, 34, 0, 80, 3])
myCalc.sortByEvenOdd(array: [58, 67, 31, 53, 43, 59, 22, 61, 71, 90, 67, 51, -9, 86, 1, 38, -5, 82, -5, -8])

myCalc.triforce(n: 1)
print()
myCalc.triforce(n: 2)
print()
myCalc.triforce(n: 5)
print()
