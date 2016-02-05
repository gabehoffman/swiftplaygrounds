//: Playground - noun: a place where people can play

import UIKit

enum TextAlignment: Int {
    case Left = 20
    case Right
    case Center
    case Justify
}

var alignment = TextAlignment.Left

var volunteerCounts = [1,3,40,32,2,53,77,13]
let volunteersSorted = volunteerCounts.sort(<)


func makeTownGrand(budget: Int, additionalStoplights: Int, condition: (Int, Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget, additionalStoplights) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        let lessLights = additionalStoplights - 1
        if let newPlan = makeTownGrand(budget, additionalStoplights: lessLights , condition: condition) {
            func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
                return toLights + lightsToAdd
            }
            if let finalLights = newPlan(0,lessLights) {
                return buildRoads(lessLights, toLights: 0)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
func evaluateBudget(budget: Int, additionalStoplights: Int) -> Bool {
    let lightCost = 2000
    let totalCost = additionalStoplights * lightCost
    return budget >= totalCost
}

var existingStopLights = 4
var stopLightsToAdd = 50
var endingStopLights: Int

if let townPlan = makeTownGrand(10000, additionalStoplights: stopLightsToAdd, condition: evaluateBudget) {
    endingStopLights = townPlan(existingStopLights, stopLightsToAdd)
} else {
    endingStopLights = existingStopLights
}
print("Knowhere has \(endingStopLights) stoplights")

enum ShapeDimensions {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case RightTriangle(base: Double, height: Double)

    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return (w * h)
        case let .RightTriangle(base: b, height: h):
            return (b * h) / 2
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w + h) * 2
        case let .RightTriangle(base: b, height: h):
            return (b + h + sqrt((b * b) + (h * h)))
        }
    }
    
}

var squareShape = ShapeDimensions.Square(10)
var rectShape = ShapeDimensions.Rectangle(width: 5, height: 10)
var pointShape = ShapeDimensions.Point
var triShape = ShapeDimensions.RightTriangle(base: 3, height: 4)

pointShape.area()
squareShape.area()
rectShape.area()
triShape.area()

pointShape.perimeter()
squareShape.perimeter()
rectShape.perimeter()
triShape.perimeter()
