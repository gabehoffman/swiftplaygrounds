//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Chapter 9: Exercises
var bucketList: [String] = ["Climb Mt. Everest"]
var newItems = [
                "Fly hot air balloon to Fiji",
                "Watch the Lord of the Rings trilogy in one day",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"
                ]
bucketList += newItems

bucketList.removeAtIndex(2)
bucketList

bucketList.count
bucketList.capacity
print(bucketList[0...2])

bucketList[2] += " in Australia"
bucketList
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", atIndex: 2)

bucketList

var moronsList = [
                "Climb Mt. Kilimanjaro",
                "Fly hot air balloon to Fiji",
                "Toboggan across Alaska",
                "Go on a walkabout in Australia",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"
                ]

let equal = (bucketList == moronsList)

let lunches = [
                "Cheeseburger",
                "Veggie Pizza",
                "Chicken Caesar Salad",
                "Black Bean Burrito",
                "Falafel wrap"
]


// Chapter 9: Challenges

var toDoList = ["Take out the garabage", "Pay Bills", "Cross off finished items"]
toDoList.isEmpty

toDoList = toDoList.reverse()





// Chapter 8: Exercises

var middleName: String? = "Calliope"

if let middleName = middleName {
    print("\(middleName)")
}

middleName

var optInt: Int? = nil
var nextInt = optInt?.successor() ?? 0
print("\(nextInt)")

var errorCodeString: String?
errorCodeString = "404"
if let theError = errorCodeString, errorCodeInteger = Int(theError){
    print("\(theError): \(errorCodeInteger)")
}

