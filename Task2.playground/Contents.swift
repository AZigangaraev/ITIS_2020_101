
import UIKit


class Motherboard{
    
    var ramModules:Int
    var processor:String
    var videoCard:String?
    var audioCard:String?
    
    init(ramModules: Int, processor: String, videoCard: String?, audioCard: String?) {
        self.ramModules = ramModules
        self.processor = processor
        self.videoCard = videoCard
        self.audioCard = audioCard
    }
}

protocol computerAssembled {
    func assembled() -> Bool
}


class Computer {
    var motherBoard: Motherboard
    var powerSupply: String
    var floppy: String?
    var opticalDrive: String?
    var memory: [Int]
    
    init(motherBoard: Motherboard, powerSupply: String, floppy: String?, opticalDrive: String?, memory: [Int]) {
        self.motherBoard = motherBoard
        self.powerSupply = powerSupply
        self.floppy = floppy
        self.opticalDrive = opticalDrive
        self.memory = memory
    }
}

class Laptop: Computer{
    var battery: String
    var monitor: String
    var keyBoard: String
    var camera: String?
    var spekers: String?
    
    init(battery: String, monitor: String, keyBoard: String, camera: String?,spekers: String, motherBoard: Motherboard, powerSupply: String, floppy: String?, opticalDrive: String?, memory: [Int]) {
        self.camera = camera
        self.spekers = spekers
        self.battery = battery
        self.monitor = monitor
        self.keyBoard = keyBoard
        super.init(motherBoard: motherBoard, powerSupply: powerSupply, floppy: floppy, opticalDrive: opticalDrive, memory: memory)
    }
}

class IMac: Computer,computerAssembled {
    func assembled() -> Bool {
        return true
    }
    
    var name:String
    
    
    init(name: String, motherBoard: Motherboard, powerSupply: String, floppy: String?, opticalDrive: String?, memory: [Int]) {
        self.name = name
        super.init(motherBoard: motherBoard, powerSupply: powerSupply, floppy: floppy, opticalDrive: opticalDrive, memory: memory)
    }
}

class MacBook: Laptop,computerAssembled{
    
    var name: String
    func assembled() -> Bool {
        return true
    }
    
    init(name: String, battery: String, monitor: String, keyBoard: String, camera: String?, spekers: String, motherBoard: Motherboard, powerSupply: String, floppy: String?, opticalDrive: String?, memory: [Int]) {
        self.name = name
        super.init(battery: battery, monitor: monitor, keyBoard: keyBoard, camera: camera, spekers: spekers, motherBoard: motherBoard, powerSupply: powerSupply, floppy: floppy, opticalDrive: opticalDrive, memory: memory)
    }
    
}
