// created by Oleg Romanov 11-906
 class Transport {
    func startMoving() {
        print("start moving")
    }
 }


 class Bus : Transport {
    private let numberOfBus = 91
    private let color = "red"

    override func startMoving() {
        print("starting movement using the engine")
    }
 }

 class Trolleybus : Transport {
    private let numberOfTrolleybus = 8
    private let color = "green"

    override func startMoving() {
        print("starting movement using electricity")
    }
 }



protocol Calculator {
    /// Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    /// Функция должна вернуть массив `n` чисел Фибоначчи. (Числа 1, 1, 2, 3, 5, 8 и т.д.)
    func fibonacci(n: Int) -> [Int]

    /// Функция должна сортировать массив таким образом, чтобы в начале массива были нечётные числа, а в конце — чётныеСортировать сами числа внутри чётных-нечётных необязательно.
    func sortByEvenOdd(array: [Int]) -> [Int]

    /// Функция должна напечатать triforce знаками "▲" и " " функцией `print`.
    /// - parameter n: Высота triforce.
    func triforce(n: Int)
}

class CustomCalculator: Calculator {
    
    // Функция должна напечатать triforce знаками "▲" и " " функцией `print`.
    func triforce(n: Int) {
        var i = 0, j = 0
        while i < n  {
            j = 0
            while j < (n - i) {
                print(" ", terminator: "")
                j += 1
            }
            for _ in 0...i * 2 {
                print("▲", terminator: "")
            }
            print()
           i += 1
        }
    }
    
    // Функция должна вернуть массив `n` чисел Фибоначчи. (Числа 1, 1, 2, 3, 5, 8 и т.д.)
    func fibonacci(n: Int) -> [Int] {
        var fibArray: [Int] = [1, 1]
        var num1 = 1, num2 = 1
        var num3: Int
        
        while fibArray.count < n {
            num3 = num1 + num2
            fibArray.append(num3)
            num1 = num2
            num2 = num3
        }
        return fibArray
    }
    
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let i1 = x / y
        let i2 = x % y
        return (i1, i2)
    }
    
    // Функция должна сортировать массив таким образом, чтобы в начале массива были нечётные числа, а в конце — чётные. Сортировать сами числа внутри чётных-нечётных необязательно.
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var sortedArray = array.filter{$0 % 2 != 0}
        sortedArray.append(contentsOf: array.filter{$0 % 2 == 0})
        return sortedArray
    }
}








