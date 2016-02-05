//:  Chapter 1 BNR Playground - Welcome

import Cocoa

let lastName = "Hoffman"
var welcome = "Hello Mr. \(lastName), welcome to the playground"
welcome += "!"

print(welcome)



//: Chapter 2 BNR Playground - Types, Constants, and Variables

let numberOfStopLights: Int = 4
var population: Int = 5420
var unemploymentRate = 4.3
var unemployedPeople = unemploymentRate * Double(population) / 100 / 2
let townName: String = "Knowhere"
let townDescription = "\(townName) has a population of \(population) and \(numberOfStopLights) stoplights. \nThere are currently \(unemployedPeople) unemployed people."

print(townDescription)



//: Chapter 3 BNR Playground - Conditionals

var message: String
var hasPostOffice: Bool = true
if population < 10000 {
    message = "\(population) is a small town!"
} else if population < 50000 {
    message = "\(population) is medium size town!"
} else if population >= 50000 {
    message = "\(population) is a very large town!"
} else {
    message = "Something has gone wrong"
}

print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}

//: Chapter 4 BNR Playground- Numbers

print("The maxium Int value is \(Int.max).")
print("The maxium Int value is \(Int32.max).")
print("The maxium Int value is \(Int16.max).")
print("The maxium Int value is \(Int8.max).")

//: Chapter 5 BNR Playground- Switch

var statusCode: Int = 404
var errorString: String

switch statusCode {
case 400:
    errorString = "Bad Request"
case 401:
    errorString = "Unauthorized Request"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not Found"
default:
    errorString = "None"
}


