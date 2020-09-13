class Family {
    var name: String = ""
}

protocol GivingMoney {
    func giveMoney()
}

protocol RequestMoney {
    func requestMoney()
}

class Dad: Family, GivingMoney {

    
    func giveMoney() {
        print("I lost money!")
    }
    
    private let stash: Int = 5000
    
    var dadMoney = 500
    var nameDad: String = "Pasha"
}

class Mom: Family, GivingMoney {
    
    func giveMoney() {
        print("I lost money!")
    }
    
    var momMoney = 50
    var nameMom: String = "Anya"
}

class Son: Family,RequestMoney {
    
    var currentMoney = 0
    
    func requestMoney() {
        dad.dadMoney -= 50
        mom.momMoney -= 20
        currentMoney += 70
        print("I've earned 70 rub haha and Son have \(currentMoney)")
    }
    
    var nameSon: String = "Fedor"
}

var son =  Son()
var mom = Mom()
var dad = Dad()

func getSum(of x: Int, y: Int) -> Int {
    x + y
}

func coinToss(count tossCount: Int) -> (heads: Int, tails: Int) {
    var tally = (heads: 0, tails: 0)
    for _ in 0...1 {
        let isHeads = Bool.random()
        if isHeads {
            tally.heads += 1
        } else {
            tally.tails += 1
        }
    }
    return tally
}

for _ in 1...10 {
    
    if son.currentMoney < getSum(of: mom.momMoney, y: dad.dadMoney) {
        son.requestMoney()
    } else {
        print("So cool, I have money!")
    }
    
    let (heads, tails) = coinToss(count: 1)
    if heads > tails {
        dad.dadMoney += 100
    } else {
        mom.momMoney += 50
    }

    print("Dad money is \(dad.dadMoney)" + " and mom's money is \(mom.momMoney)")
}


