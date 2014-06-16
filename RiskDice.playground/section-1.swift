// Playground - noun: a place where people can play

import Cocoa

protocol RandomNumberGenerator {
    func random(sides: Int) -> Int
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom: Double = 42.0
    var seedNumber: Int = Int (arc4random_uniform(42))
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random(sides: Int) -> Int {
        seedNumber = Int (arc4random_uniform(UInt32(lastRandom)))
        lastRandom = ((lastRandom * a + c) % m)
        var newRandom = (lastRandom / m) * Double(sides) + 1
        //println("Generated dice roll is \(newRandom)")
        return Int(newRandom)
    }
}

class StandardGenerator: RandomNumberGenerator {
    
    func random(sides: Int) -> Int {
        var fromNumber: Int = 1;
        var toNumber: Int = 6;
        var randomNumber: Int = Int(arc4random_uniform(UInt32(sides)))+1
        //println("Generated dice roll is \(randomNumber)")
        return (randomNumber)
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random(sides))
    }
}

println("Linear Congruential Generator Dice")
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    println("Random dice roll is \(d6.roll())")
}

println("\nArc Random Dice")
var arcD6 = Dice(sides: 6, generator: StandardGenerator())
for _ in 1...5 {
    println("Random dice roll is \(arcD6.roll())")
}

func testRandomness(turns: Int, sides: Int, generator: RandomNumberGenerator) {
    let testDice = Dice(sides: sides, generator: generator)
    var testRoll = 0
    var numberOfOnes = 0
    var numberOfTwos = 0
    var numberOfThrees = 0
    var numberOfFours = 0
    var numberOfFives = 0
    var numberOfSixes = 0
    var numberOfErrors = 0
    for i in 0..turns {
        testRoll = testDice.roll()
        switch testRoll {
        case 1: numberOfOnes++
        case 2: numberOfTwos++
        case 3: numberOfThrees++
        case 4: numberOfFours++
        case 5: numberOfFives++
        case 6: numberOfSixes++
        default: numberOfErrors++
        }
    }
    let percentOnes = Double(numberOfOnes) / Double(turns) * 100
    let percentTwos = Double(numberOfTwos) / Double(turns) * 100
    let percentThrees = Double(numberOfThrees) / Double(turns) * 100
    let percentFours = Double(numberOfFours) / Double(turns) * 100
    let percentFives = Double(numberOfFives) / Double(turns) * 100
    let percentSixes = Double(numberOfSixes) / Double(turns) * 100

    println("\nOut of \(turns) turns \n it was a 1 \(percentOnes)% \n it was a 2 \(percentTwos)% \n it was a 3 \(percentThrees)% \n it was a 4 \(percentFours)% \n it was a 5 \(percentFives)% \n it was a 6 \(percentSixes)% ")
}

//testRandomness(500, 6, LinearCongruentialGenerator())
//testRandomness(500, 6, StandardGenerator())
