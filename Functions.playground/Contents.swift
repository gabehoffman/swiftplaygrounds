//: Playground - noun: a place where people can play

import UIKit

// Chapter 12 - Functions


func printGreeting() {
    print("Hello, playground")
}

printGreeting()

func printPersonalGeeting(names: String...) {
    for name in names {
        print("Hello \(name), welcome to your playground.")
    }
}

printPersonalGeeting("Gabe", "Marci")

func divisionDescription(forNumerator num: Double, andDenominator den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}

divisionDescription(forNumerator: 9.0, andDenominator: 3.0
)

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return(evens,odds)
}

// Challenges - NEED TO BE DONE



// Chapter 13- Closures

let numbers = [1,34,23,54,67,22,123,543,234]

func 👍(i: Int, j: Int) -> Bool {
    return i < j
}

func 👎(i: Int, j: Int) -> Bool {
    return i > j
}

numbers.sort(👍)
numbers.sort(👎)

let precintPopulations = [1244, 2021, 2157]
let projectedPopulations = precintPopulations.map {$0 * 2}
projectedPopulations

let bigProjections = projectedPopulations.filter {$0 > 4000}
bigProjections

let totalProjections = projectedPopulations.reduce(0, combine: +)
totalProjections