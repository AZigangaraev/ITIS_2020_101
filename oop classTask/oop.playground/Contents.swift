import UIKit

class Vehicle {
    var engine: Int
    
    init(engine:Int){
        self.engine=engine
    }
    func engineOn() {
        print("включение двигателя")
    }
    class car:Vehicle{
        var doors:Int
        
        init(engine:Int,doors:Int){
            self.doors=doors
            super.init(engine: <#T##Int#>)
        }
        override func engineOn() {
            super.engineOn()
            print("завожу машину")
        
        }
        class motobike:Vehicle{
            var twoWheel: Int
            init(engine:Int,twoWheel:Int) {
                self.twoWheel=twoWheel
                super.init(engine: <#T##Int#>)
            }
            override func engineOn() {
                print("завожу мотоцикл")
            }
        }
    }
    
}
