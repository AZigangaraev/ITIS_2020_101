protocol Calculator {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    
    func fibonacci(n: Int) -> [Int]
    
    func sortByEvenOdd(array: [Int]) -> [Int]

    func triforce(n: Int)
}

class MyCalculator: Calculator {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }

    func fibonacci(n: Int) -> [Int] {
        
        switch n {
        case 0:
            return []
        case 1:
            return [1]
        default:
            var array: [Int] = []
            array.append(1)
            array.append(1)
            for i in 2..<n {
                array.append(array[i - 1] + array[i - 2])
            }
            return array
        }
    }

    func sortByEvenOdd(array: [Int]) -> [Int] {
        return array.sorted(by: {$0 % 2 == 1 && $1 % 2 == 0})
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

//проверки

var example = MyCalculator()

example.divideWithRemainder(13, by: 1)

example.fibonacci(n: 0)
example.fibonacci(n: 1)
example.fibonacci(n: 2)
example.fibonacci(n: 6)

example.sortByEvenOdd(array: [2, 3, 4, 6, 8, 1, 7, 9])

example.triforce(n: 9)

