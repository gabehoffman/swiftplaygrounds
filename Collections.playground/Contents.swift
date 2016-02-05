//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Dictionaries

var foreverYoung: [String:Int?] = [:]
foreverYoung = ["Matt" : 32, "John" : 33, "Nate" : 15, "TJ" : 28, "Rod" : 97]

foreverYoung.removeValueForKey("Matt")
foreverYoung

var optional: Int? = 15

for (key, value) in foreverYoung {
    print(key, value)
}

var GA = [
            "Gwinnett": [30001, 30002, 30003, 30004, 30005],
            "Dekalb": [30011, 30012, 30013, 30014, 30015],
            "Cobb": [30021, 30022, 30023, 30024, 30025]
        ]

var zipcodes: [Int] = []
for v in GA.keys {
    let newzips = GA[v]!
    for z in newzips {
     zipcodes.append(z)
    }
}

print(zipcodes)


// Chapter 11- Sets

var groceryBag = Set<String>()
var friendsGroceryBag: Set = ["Bananas", "Cereal", "Milk", "Oranges"]

groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")
groceryBag.insert("Apples")

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

groceryBag.unionInPlace(friendsGroceryBag)
groceryBag.contains("Bananas")


// Challenges

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco",])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])

myCities.intersect(yourCities) == yourCities


