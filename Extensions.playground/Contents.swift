//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

typealias Velocity = Double

enum direction: Int {
    case North = 0
    case East = 90
    case South = 180
    case West = 270
}

extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
    var mps: Velocity { return self * 0.44704 }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    let doorCount: Int
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New Value must be valid.")
        }
    }
}

extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return doorCount }
    var hasFlatbed: Bool { return false }
}

extension Car {
    init (carMake: String, carModel: String, carYear: Int, doorCount: Int) {
        self.init(make: carMake, model: carModel, year: carYear, color: "Black", nickname: "N/A", doorCount: doorCount, gasLevel: 1)
    }
}

var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013, doorCount: 2)

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

c.kind.description

extension Car {
    mutating func emptyGas(amount: Double) -> Bool{
        if (amount <= 1 && amount > 0 && amount <= gasLevel) {
            gasLevel -= amount
            return true
        } else {
            return false
        }
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
c.emptyGas(0.3)
c.emptyGas(0.3)
c.emptyGas(0.3)
c.emptyGas(1.3)

c.gasLevel
c.fillGas()
c.gasLevel

// Challenges

extension Int {
    var timesFive: Int { return self * 5 }
}

5.timesFive



