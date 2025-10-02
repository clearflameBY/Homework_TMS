import UIKit

//var greeting = "Hello, playground"
//Task 2
var year: Int = 2025
var condition: Bool = false
var weght: Float = 70.5
var height: Double = 1.785
var name: String = "Ilya"
let age: Int = 28
let state: Bool = true
let width: Float = 23.78
let depth: Double = 12.567
let surname: String = "Stepanenko"
print(Int8.min)
print(Int8.max)
print(Int16.min)
print(Int16.max)
print(Int32.min)
print(Int32.max)
print(UInt16.min)
print(UInt16.max)
print(UInt.min)
print(UInt.max)
print(surname.count)
//Task 3
print(Int(15.4))
print(Double(14))
print(String(age))
print(String(condition))
let letter: Character = "a"
print(String(letter))
let number: Double = 123456.789
print(Float(number))
//Task 4
print("3 * 2 = \(3 * 2)")
print("10 / 2 = \(10 / 2)")
print("2 + 2 = \(2 + 2)")
print("10 - 2 = \(10 - 2)")
print("7 % 2 = \(7 % 2)")
//Task 5
let hour = 34
if hour >= 0 && hour < 4 {
    print("isNight")
} else if hour > 24 {
    print("Incorrect time")
} else if hour < 0 {
    print("Incorrect time")
} else {
    print("notNight")
}
//Task 6
let number1 = 13
let number2 = 2
let number3 = 20
let number4 = 21
let number5 = 76
if number1 % 2 == 0 {
    print("The number \(number1) is even")
} else {
    print("The number \(number1) is odd")
}
if number2 % 2 == 0 {
    print("The number \(number2) is even")
} else {
    print("The number \(number2) is odd")
}
if number3 % 2 == 0 {
    print("The number \(number3) is even")
} else {
    print("The number \(number3) is odd")
}
if number4 % 2 == 0 {
    print("The number \(number4) is even")
} else {
    print("The number \(number4) is odd")
}
if number5 % 2 == 0 {
    print("The number \(number5) is even")
} else {
    print("The number \(number5) is odd")
}
//Task 7
let day: Int = 25
switch day {
case 1...10:
    print("First decade")
case 11...20:
    print("Second decade")
case 21...30:
    print("Third decade")
case 31:
    print("Fourth decade")
default:
    print("Wrong number")
}
//Task 8
let string1 = "bbppeeyy"
if string1.first == "a" {
    print("Yes")
} else {
    print("No")
}
let string2 = "auiudie"
if string2.first == "a" {
    print("Yes")
} else {
    print("No")
}
let string3 = "Auiudie"
if string3.first == "a" {
    print("Yes")
} else {
    print("No")
}
let string4 = "qwiudie"
if string4.first == "a" {
    print("Yes")
} else {
    print("No")
}
//Task 9
for firstMultiplier in 1...10 {
    for secondMultiplier in 1...10 {
        print("\(firstMultiplier) * \(secondMultiplier) = \(firstMultiplier * secondMultiplier)")
    }
}
