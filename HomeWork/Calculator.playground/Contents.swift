import UIKit

class Calculator{
    
    func fibonacci(_ n:Int) -> Int {

        var a = 0
        var b = 1

        for _ in 0..<n {
            a += b
            b = a - b
        }
        return a
    }
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int){
         return (x/y,x%y)
    }


func sortByEvenOdd(array: [Int]) -> [Int]{
    let array = [1, 2, 3, 4, 5, 6]
    let sortArray = array.filter{$0 % 2 == 1} + array.filter{$0 % 2 == 0}
   return sortArray
}
func triforce(n: Int) {
    let triangle = "▲"
    var Index = 1
    var Index1 = 1
    while Index1 <= n {
        
        var str = ""
        var indent = n
        
        while indent > Index1 {
            str += " "
            indent -= 1
        }
        
        var x = 1
        
        while x <= Index {
            str += triangle
            x += 1
        }
        
        Index1 += 1
        Index += 2
        print(str)
        str = ""
    }
}
    
}

 
  


