class Vehicle {
    let model: String
    let consumption: Float      // liters per km
    let fuelTankCapacity: Float // liters
    private(set) var fuelLeft: Float
    private(set) var kilometrage: Float = 0.0
    
    init(model: String, consumption: Float, fuelTankCapacity: Float) {
        self.model = model
        self.consumption = consumption
        self.fuelTankCapacity = fuelTankCapacity
        fuelLeft = fuelTankCapacity
    }
    
    func move(kilometers: Float) {
        let fuelRequired = consumption * kilometers
        if fuelRequired > fuelLeft {
            print("\(model) doesn't have enough fuel to move.")
        } else {
            fuelLeft -= fuelRequired
            kilometrage += kilometers
            print("\(model) moved \(kilometers) kilometers. \(fuelLeft) liters left.")
        }
    }
    
    func fillTank(withLiters fuelAmount: Float) {
        let result = fuelLeft + fuelAmount
        fuelLeft = result > fuelTankCapacity ? fuelTankCapacity : result
    }
    
    func printDescription() {
        print("""
            Model: \(model)
            Fuel: \(fuelLeft) / \(fuelTankCapacity)
            Kilometrage: \(kilometrage)
            """)
    }
}

class PrivateVehicle: Vehicle {
    var owner: Owner?
    
    override func printDescription() {
        super.printDescription()
        print("Owner: \(owner?.name ?? "Nobody")")
    }
}

class Owner {
    let name: String
    var vehicle: PrivateVehicle?
    
    init(name: String) {
        self.name = name
    }
    
    func purchase(vehicle: PrivateVehicle) {
        self.vehicle = vehicle
        vehicle.owner = self
    }
    
    func sellVehicle() {
        vehicle?.owner = nil
        vehicle = nil
    }
}

class Car: PrivateVehicle {
    let numberOfDoors: Int
    
    init(model: String, consumption: Float, fuelTankCapacity: Float, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(model: model, consumption: consumption, fuelTankCapacity: fuelTankCapacity)
    }
    
    override func printDescription() {
        super.printDescription()
        print("Number of Doors: \(numberOfDoors)")
    }
}

class PublicVehicle: Vehicle {
    private(set) var fare: Int // rubles
    
    init(model: String, consumption: Float, fuelTankCapacity: Float, fare: Int) {
        self.fare = fare
        super.init(model: model, consumption: consumption, fuelTankCapacity: fuelTankCapacity)
    }
    
    func setFare(_ newFee: Int) {
        if newFee > 0 {
            fare = newFee
        }
    }
    
    override func printDescription() {
        super.printDescription()
        print("Fare: \(fare) ₽")
    }
}

class Bus: PublicVehicle {
    let passengerCapacity: Int
    
    init(model: String, consumption: Float, fuelTankCapacity: Float, fare: Int, passengerCapacity: Int) {
        self.passengerCapacity = passengerCapacity
        super.init(model: model, consumption: consumption, fuelTankCapacity: fuelTankCapacity, fare: fare)
    }
    
    override func printDescription() {
        super.printDescription()
        print("Passenger Capacity: \(passengerCapacity) people")
    }
}
