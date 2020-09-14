import UIKit

class Music {
    var age: Int
    var sex: String
    var genre: String
    var fans: Int
    
    init(age: Int, sex: String, genre:String, fans:Int) {
    self.age = age;
    self.sex = sex;
    self.genre = genre;
    self.fans = fans;
    }
    func Shopping(){}
    func Concert(fans:Int){
        if fans > 100 {
            print("Making some noise")
        }
    }
    
    func Overhype() -> String{
        if age <= 30 && sex == "Male" && genre == "Trap" {
            return "overhyped!!!!"
        }
        else {
            return "Unpopular(";
        }
    }
}
class Hiphop:Music {
    var YearsOnStage: Int;
    init(age:Int,sex:String,genre:String,fans:Int,YearsOnStage:Int) {
        self.YearsOnStage = YearsOnStage
        super.init(age: age,sex: sex,genre:genre,fans:fans)
    }
    override  func Shopping() {
    if fans >= 10000 {
        print("I'm goin' to the IceBox")
    } else {
        print("I'm broke")
    }
    }
}
var Dababy = Hiphop(age: 28, sex: "Male", genre: "Trap", fans: 100000000, YearsOnStage:  7)
var LilUziVert = Hiphop(age: 26, sex: "Male", genre: "Rap", fans: 110000000, YearsOnStage:  10)
LilUziVert.Shopping()
Dababy.Overhype()
