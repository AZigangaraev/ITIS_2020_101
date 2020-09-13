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

class CalculatorOperation: Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return(x / y, x % y)
    }
    
    func fibHelp(_ n: Int) -> Int {
        if (n == 0){
            return 0
        } else if (n == 1){
            return 1
        }
        return fibHelp(n - 2) + fibHelp(n - 1)
    }
    
    var x: [Int] = []
    func fibonacci(n: Int) -> [Int] {
        for i in 1...n {
            x.append(fibHelp(i))
        }
        return x
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var even = [Int]()
        var uneven = [Int]()
        for i in array {
            if i % 2 == 0 {
                even.append(i)
            } else {
                uneven.append(i)
            }
        }
        return (even + uneven)
    }
    
    func triforce(n: Int) {
        let columns = 4 * n - 1
        let center = columns / 2 + 1
        for i in 1...n {
            for j in 1...columns {
                if (j > center - i && j < center + i) {
                    print("▲", terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            print()
        }
        for i in 1...n {
            for _ in 1...2 {
                for j in 1...center {
                    if (j > n - i && j < n + i) {
                        print("▲", terminator: "")
                    } else {
                        print(" ", terminator: "")
                    }
                }
            }
            print()
        }
    }
}

var calc = CalculatorOperation()

print(calc.divideWithRemainder(3, by: 2))

print(calc.fibonacci(n: 10))

print(calc.sortByEvenOdd(array: [3,2,4,5,6]))

calc.triforce(n: 3)
