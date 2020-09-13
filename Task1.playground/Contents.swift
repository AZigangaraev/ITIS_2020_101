 
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

 class Calc: Calculator{
    
    var share = Calc()
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return(x/y,x%y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        
        if(n == 0){
            return []
        }
        
        if(n == 1){
            return [1]
        }
        
        if(n == 2){
            return [1,1]
        }
        
        var array: [Int] = [1,1]
        for i in 2..<n {
            array.append((array[i-1] + array[i-2]))
        }
        return array
    }
    
    func sortByEvenOdd(array: [Int]) -> [Int] {
        var notTwo: [Int] = []
        var doTwo: [Int] = []
        for i in array {
            if(i%2 == 0){
                doTwo.append(i)
            } else {
                notTwo.append(i)
            }
        }
        notTwo.append(contentsOf: doTwo)
        return notTwo
        
    }
    
    func triforce(n: Int) {
         let tre = "▲"
        let space = " "
        
        
        for i in 0..<n{
            var str = ""
            for _ in 1...((n*2)-i-1){
                str.append(space)
            }
            for _ in 0...(i*2){
                str.append(tre)
            }
            print(str)
        }
        
        for i in 0..<n{
            var str = ""
            for _ in 0..<(n-i-1){
                str.append(space)
            }
            for _ in 0...(i*2) {
                str.append(tre)
            }
            for _ in 1...((n*2) - (i*2)-1) {
                str.append(space)
            }
            for _ in 0...(i*2) {
                str.append(tre)
            }
            print(str)
        }
    }

    
}
 
 var calc = Calc()
 print(calc.divideWithRemainder(5,by: 2))
 print(calc.fibonacci(n: 10))
 print(calc.sortByEvenOdd(array: [1,2,4,6,8,3,5,12,9]))
 print(calc.triforce(n: 5))

