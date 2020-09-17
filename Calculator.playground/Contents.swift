protocol Calculator {
    /// Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder( x: Int, by y: Int) -> (Int, Int)
    /// Функция должна вернуть массив `n` чисел Фибоначчи. (Числа 1, 1, 2, 3, 5, 8 и т.д.)
    func fibonacci(n: Int) -> [Int]
    /// Функция должна сортировать массив таким образом, чтобы в начале массива были нечётные числа, а в конце — чётные. Сортировать сами числа внутри чётных-нечётных необязательно.
    func sortByEvenOdd(array: [Int]) -> [Int]
    /// Функция должна напечатать triforce знаками "▲" и " " функцией `print`.
    /// - parameter n: Высота triforce.
    func triforce(n: Int)
    }
class Computer: Calculator {
    func divideWithRemainder( x: Int, by y: Int) -> (Int, Int) {
        let del:Int = x / y
        let ost:Int = x % y
        return(del,ost)
    }
    func fibonacci(n: Int) -> [Int] {
        var arrayfib = Array (repeating: 0, count: n)
        arrayfib[0]=1
        arrayfib[1]=1
        var a = 1
        var b = 1
        for i in 2...n-1 //(let i = 3; i <= n; i++)
        {
          let c = a + b
          a = b
          b = c
          arrayfib[i]=b
        }
        return arrayfib
    }
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var array1:[Int] = array
        var startIndex = 0
        var endIndex = array1.count - 1
        while (startIndex < endIndex)
        {
            while (startIndex < endIndex && (array1[startIndex] % 2) != 0){
                startIndex+=1
            }
            if (startIndex >= endIndex){
                break;
            }
            while (startIndex < endIndex && (array1[endIndex] % 2) == 0){
                endIndex-=1
            }
            if (startIndex >= endIndex){
                break;
            }
            let temp = array1[startIndex]
            array1[startIndex]=array1[endIndex]
            array1[endIndex] = temp
            
            startIndex+=1
            endIndex-=1
        }
        return array1
    }
    func triforce(n: Int) {
        let space:Character = " "
        let block:Character = "▲"
        
        
        for row in 1...n
        {
            for _ in 1...(n*2-row + 1){
                print(space, terminator:"")}
            for _ in 1...(row * 2 - 1){
                print(block, terminator:"")}
            for _ in 1...(n*2-row + 1){
                print(space,terminator:"")}
            print()
        }
        for row1 in 1...n
        {
        
            for _ in 1...(n-row1+1){
                print(space,terminator:"")}
            for _ in 1...(row1 * 2 - 1){
                print(block, terminator:"")}
            for _ in 1...((n - row1) * 2 + 1){
                print(space, terminator:"")}
            for _ in 1...(row1 * 2 - 1){
                print(block, terminator:"")}
            for _ in 1...(n-row1+1){
                print(space, terminator:"")}
            print()
        }
        
        
    }
}
let Computer1 = Computer()
print(Computer1.divideWithRemainder(x: 15,by: 2))
print(Computer1.fibonacci(n: 10))
let array:[Int] = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
print("Начальный массив be like: \(array)" + " Новый массив be like: \(Computer1.sortByEvenOdd(array: array))")
Computer1.triforce(n: 5)

