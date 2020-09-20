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

class Phone: Calculator {
    
    func divideWithRemainder( x: Int, by y: Int) -> (Int, Int) {
        let divider:Int = x / y
        let residue:Int = x % y
        return(divider,residue)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var arrFibonacci = Array (repeating: 0, count: n)
        arrFibonacci[0] = 1
        arrFibonacci[1] = 1
        var a = 1
        var b = 1
        for i in 2...n-1
        {
          let c = a + b
          a = b
          b = c
          arrFibonacci[i] = b
        }
        return arrFibonacci
    }
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var arrOne: [Int] = array
        var indexFirst = 0
        var indexEnd = arrOne.count - 1
        while (indexFirst < indexEnd)
        {
            while (indexFirst < indexEnd && (arrOne[indexFirst] % 2) != 0) {
                indexFirst+=1
            }
            if (indexFirst >= indexEnd){
                break;
            }
            while (indexFirst < indexEnd && (arrOne[indexEnd] % 2) == 0) {
                indexEnd-=1
            }
            if (indexFirst >= indexEnd) {
                break;
            }
            let temp = arrOne[indexFirst]
            arrOne[indexFirst]=arrOne[indexEnd]
            arrOne[indexEnd] = temp
            
            indexFirst+=1
            indexEnd-=1
        }
        return arrOne
    }
    
    
    func triforce(n: Int) {
        let free: Character = " "
        let triang: Character = "▲"
        
        
        for line in 1...n
        {
            for _ in 1...(n * 2 - line + 1){
                
                print(free, terminator:"")}
            
            for _ in 1...(line * 2 - 1){
                
                print(triang, terminator:"")}
            
            for _ in 1...(n*2-line + 1){
                
                print(free,terminator:"")}
            
            print()
        }
        for line2 in 1...n
        {
        
            for _ in 1...(n-line2+1){
                
                print(free,terminator:"")}
            
            for _ in 1...(line2 * 2 - 1){
                
                print(triang, terminator:"")}
            
            for _ in 1...((n - line2) * 2 + 1){
                
                print(free, terminator:"")}
            
            for _ in 1...(line2 * 2 - 1){
                
                print(triang, terminator:"")}
            
            for _ in 1...(n-line2+1){
                
                print(free, terminator:"")}
            
            print()
        }
        
        
    }
}
let phone = Phone()
print(phone.divideWithRemainder(x: 23,by: 5))
print(phone.fibonacci(n: 5))
let array:[Int] = [2, 5, 6, 7, 33, 56, 78, 12]
print("Array at the begining: \(array)" + " New array: \(phone.sortByEvenOdd(array: array))")
phone.triforce(n: 10)

