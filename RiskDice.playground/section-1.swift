// Playground - noun: a place where people can play

import Cocoa

protocol RandomNumberGenerator {
    func random(sides: Int) -> Int
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom: Double = 42.0
    var seedNumber: Double = Double (arc4random_uniform(42))
    let m = 139_968.0
    let a = 3_877.0
    let c = 29_573.0
    func random(sides: Int) -> Int {
        seedNumber = Double(arc4random_uniform(UInt32(lastRandom * 10)))
        lastRandom = ((seedNumber * a + c) % m)
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

func battle (initAttackers: Int, initDefenders: Int, dice: Dice) -> Int {
    let d6 = dice
    var attackingRolls: Int[] = [0,0,0]
    var defendingRolls: Int[] = [0,0]
    var attackers = initAttackers
    var defenders = initDefenders
    var turnNumber = 0
    while ((attackers > 0) && (defenders > 0)) {
        turnNumber++
        attackingRolls = [0,0,0]
        defendingRolls = [0,0]
        //println( "Turn Number \(turnNumber)")
        attackingRolls[0] = d6.roll()
        //println( "Attack rolls a  \(attackingRolls[0])")
        defendingRolls[0] = d6.roll()
        //println( "Defense rolls a  \(defendingRolls[0])")
        if (attackers > 1) {
            attackingRolls[1] = d6.roll()
            //println( "Attack rolls a  \(attackingRolls[1])")
        }
        if (attackers > 2) {
            attackingRolls[2] = d6.roll()
            //println( "Attack rolls a  \(attackingRolls[2])")
        }
        if (defenders > 1) {
            defendingRolls[1] = d6.roll()
            //println( "Defense rolls a  \(attackingRolls[1])")
        }
        attackingRolls = sort(attackingRolls) {$0 > $1}
        //println( "Attacking Dice \(attackingRolls)")
        defendingRolls = sort(defendingRolls) {$0 > $1}
        //println( "Defending Dice \(defendingRolls)")
        //attackingRolls[0]++
        //defendingRolls[0]++
        if attackingRolls[0] > defendingRolls[0] {
            //println( "Defenders Lose 1")
            defenders--
        } else {
            //println( "Attackers Lose 1")
            attackers-- }
        if ((attackingRolls[1] > 0) && (defendingRolls[1] > 0)){
            if attackingRolls[1] > defendingRolls[1] {
                //println( "Defenders Lose 1")
                defenders-- }
            else {
                //println( "Attackers Lose 1")
                attackers-- }
        }
    }
    if defenders == 0 {
        //println( "Attackers win with \(attackers) men")
        return attackers
    } else {
        //println( "Defenders win with \(defenders) men")
        return (0-defenders) }
}

var attackers = 4
var defenders = 4
var turns = 100
var wins = 0
var winPercent = 1000.0
println("\nBattle begins \(attackers) v \(defenders)")
for i in 1...turns {
    var results = 0
    results = battle(attackers, defenders,d6)
    if results > 0 { wins++ }
}
winPercent = (Double(wins) / Double(turns)) * 100
println("Attackers win \(winPercent)% of the time")

wins = 0
winPercent = 1000.0
println("\nBattle begins \(attackers) v \(defenders)")
for i in 1...turns {
    var results = 0
    results = battle(attackers, defenders, arcD6)
    if results > 0 { wins++ }
}
winPercent = (Double(wins) / Double(turns)) * 100
println("Attackers win \(winPercent)% of the time")
