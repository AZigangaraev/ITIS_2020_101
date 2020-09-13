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

class CalculatorClass: Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x/y, x%y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        
        if (n == 0){
            return []
        }
        
        if(n == 1){
            return[1]
        }
        
        var fibonacciArr: [Int] = []
        
        for i in 0...n-1{
            if (i == 0){
                fibonacciArr.append(1)
            } else if (i == 1){
                fibonacciArr.append(1)
            } else {
                fibonacciArr.append(fibonacciArr[i-1] + fibonacciArr[i-2])
            }
        }
        
        return fibonacciArr
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var resultArray = array
        for i in 0...resultArray.count-1 {
            for j in 0...resultArray.count-2 {
                if (resultArray[j] % 2 == 0 && resultArray[j+1] % 2 != 0){
                    var changer = resultArray[j]
                    resultArray[j] = resultArray[j+1]
                    resultArray[j+1] = changer
                }
            }
        }
        return resultArray
    }
    
    func triforce(n: Int) {
        for i in 1...n {
            for _ in 0...2*n-i {
                print(terminator: " ")
            }
            for _ in 1...2*i-1 {
                print(terminator: "▲")
            }
            print()
        }
        for i in 1...n {
            for _ in 0...n-i {
                print(terminator: " ")
            }
            for _ in 1...2*i-1 {
                print(terminator: "▲")
            }
            for _ in 0...2*n-2*i {
                print(terminator: " ")
            }
            for _ in 1...2*i-1 {
                print(terminator: "▲")
            }
            print()
        }
    }
}

var calculator = CalculatorClass()
print(calculator.divideWithRemainder(9, by: 2))
var fibArr = calculator.fibonacci(n: 10)
print(fibArr)
let array = [1, 3, 4, 1, 6, 9, 19, 20, 21, 22, 23]
var result = calculator.sortByEvenOdd(array: array)
print(result)
calculator.triforce(n: 5)
