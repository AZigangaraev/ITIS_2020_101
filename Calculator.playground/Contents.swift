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

class Phone: Calculator {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var arr = [Int?](repeating: nil, count: n)
        arr[0] = 1
        arr[1] = 1
        for i in 2...n-1 {
            arr[i] = arr[i-1]! + arr[i-2]!
        }
        return (arr) as! [Int]
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var arr = array
        for i in 0..<array.count - 1 {
            for j in i+1..<arr.count {
                if arr[j] % 2 != 0 && arr[i] % 2 == 0 {
                    arr.swapAt(i, j)
                }
            }
        }
        return arr
    }
    
    func triforce(n: Int) {
        var b = 1;
        var a = 1;
        var c = 1;
        
         
        if (n%2 == 0) {
           print("Error...")
        } else {
            for i in 0..<n {
                for _ in stride(from: n * 2 - 1, to: i, by: -1) {
                    print(" ",terminator: "")
                }
                for _ in 0..<b {
                    print("▲",terminator: "")
                }
                b += 2;
                print()
            }
            b = 1;
            for i in 0..<n {
                for _ in (i + 1)..<n {
                    print(" ",terminator: "")
                }
                for _ in 0..<b {
                    print("▲",terminator: "")
                }
                b += 2;
                for _ in stride(from: n * 2, to: a, by: -1) {
                    print(" ",terminator: "")
                }
                a += 2;
                for _ in 0..<c {
                    print("▲",terminator: "")
                }
                c += 2;
                print()
            }
         }
    }
}

let phone = Phone()
phone.divideWithRemainder(8, by: 3)
phone.fibonacci(n: 5)
phone.sortByEvenOdd(array: [1,5,3,2,6,7,8])
phone.triforce(n: 7)

