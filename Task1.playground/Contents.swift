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

var str = "Hello, playground"

class StrangeCalculator: Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        if n < 1 {
            return []
        }
        if n == 1 {
            return [1]
        }
        
        var result = [1, 1]
        for i in 2..<n {
            result.append(result[i - 1] + result [i - 2])
        }
        return result
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var odd = [Int]()
        var even = [Int]()
        
        for num in array {
            if num % 2 == 1 {
                odd.append(num)
            } else {
                even.append(num)
            }
        }
        
        odd.sort()
        even.sort()
        
        odd.append(contentsOf: even)
        return odd
    }

    func triforce(n: Int) {
        let space = " "
        let block = "▲"
        
        var rowStr = ""
        // Top triangle
        for row in 1...n {
            var i = 0
            while i < n * 2 - row {
                rowStr.append(space)
                i += 1
            }
            i = 0
            while i < row * 2 - 1 {
                rowStr.append(block)
                i += 1
            }
            i = 0
            while i < n * 2 - row {
                rowStr.append(space)
                i += 1
            }
            rowStr.append("\n")
        }
        
        // Bottom triangles
        for row in 1...n {
            var i = 0
            while i < n - row {
                rowStr.append(space)
                i += 1
            }
            i = 0
            while i < row * 2 - 1 {
                rowStr.append(block)
                i += 1
            }
            i = 0
            while i < (n - row) * 2 + 1 {
                rowStr.append(space)
                i += 1
            }
            i = 0
            while i < row * 2 - 1 {
                rowStr.append(block)
                i += 1
            }
            i = 0
            while i < n - row{
                rowStr.append(space)
                i += 1
            }
            rowStr.append("\n")
        }
        
        print(rowStr)
    }
    
    
}

// Checking Task1
var strangeCalculator = StrangeCalculator()
print(strangeCalculator.divideWithRemainder(22, by: 8))
print(strangeCalculator.fibonacci(n: 10))
print(strangeCalculator.sortByEvenOdd(array: [2, 1, 3, 4, 7, 12, 15, 2, 5]))
strangeCalculator.triforce(n: 20)

