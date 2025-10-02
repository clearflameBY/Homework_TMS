import UIKit

//1. Написать функции, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
//должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.

func printHelloWorld() {
    print("Hello, world!")
}
// TODO: Пробел перед {
func printHi(_ name: String) {
    print("Hello, \(name)")
}
printHi("Max")
func helloAndName(name: String) -> String {
    "Hello! \(name)"
}
//print(helloAndName(name: "Ilya"))

//2. Написать функцию, которая принимает две строки и возвращает сумму количества
//символов двух строк.
func sumOfTheNumberOfCharactersInTheStrings(string1: String, string2: String) -> Int {
    let string3 = string1 + string2
    return string3.count
}

//3. Написать функцию, которая выводит в консоль квадрат переданного числа.
func outputsTheSquareOfANumber(number: Double) {
    print(number * number)
}

//4. Создать функцию, которая принимает параметры и вычисляет площадь круга.
func calculateTheAreaOfACircle(radius: Double) -> Double {
    Double.pi * pow(radius, 2)
}

//5. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток. Можно делать с логическим типом, можно делать со временем.
func isItNightTonight(hour: Int) -> String {
    if hour > 0 && hour < 12 {
        return "Night"
    } else if hour >= 12 && hour <= 24 {
        return "Day"
    } else {
        return "Incorect time"
    }
}

//6. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
//осень).
func determinesTheSeason(month: Int) -> String {
    if month == 1 || month == 2 || month == 12 {
        return "Winter"
    } else if month >= 3 && month <= 5 {
        return "Spring"
    } else if month >= 6 && month <= 8 {
        return "Summer"
    } else if month >= 9 && month <= 11 {
        return "Autumn"
    } else {
        return "Incorrect month"
    }
}

// 7. Разбить номер телефона на составляющие. Код страны, код оператора, сам номер.
//Используем функции строки: prefix, suffix.
func breakingDownAPhoneNumberIntoItsComponents(phoneNumber: String) {
    let countryCode = phoneNumber.prefix(3)
    let countryAndOperatorCode = phoneNumber.prefix(5)
    let operatorCode = countryAndOperatorCode.suffix(2)
    let number = phoneNumber.suffix(7)
}

//8*. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
//true, если оно простое, и false, если сложное. Рекомендую попробовать решать рекурсией, чтобы разобраться как она работает.
func calculatinWhetherANumberIsPrime(number: Int) -> Bool {
    guard number >= 2 else { return false }
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

//9*. Создать функцию, которая считает факториал введённого числа.
func factorialCalculation(number: Int) -> Int {
    if number == 0 {
        return 1
    }
    return number * factorialCalculation(number: number - 1)
}

//10*. Создать функцию, которая выводит все числа последовательности Фибоначчи до
//введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8

func calculatingTheFibonacciSequenceNumber(_ n: Int) -> Int {
    // TODO: Пробел перед {
    if n == 0 {
        return 0
    // TODO: else пишем в одну строку после } и пробелы перед открывающейся скобкой
    } else if n == 1 {
        return 1
    }
    // TODO: Пробелы с двух сторон между арифетическими знакакми
    return calculatingTheFibonacciSequenceNumber(n - 1) + calculatingTheFibonacciSequenceNumber(n - 2)
}

func printTheFibonacciSequence(index: Int) {
    // TODO: Не нужны пробелы перед и после ...
    for iterator in 0...index {
        print(calculatingTheFibonacciSequenceNumber(iterator))
    }
}

//11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции (Int).

func calculatingTheSumOfAFourDigitNumber(number: Int) -> String {
    let sumInString = String(number)
    guard sumInString.count == 4 else {
        return "Error: the number is not four digits"
    }
    let stringInArray = Array(sumInString)
    var sum: Int = 0
    for character in stringInArray {
        if let digit = Int(String(character)) {
            sum += digit
        }
    }
    return "Sum of the digits of a number \(number) equals \(sum)"
}
