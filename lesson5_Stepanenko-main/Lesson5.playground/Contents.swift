import UIKit
// MARK: First task
enum Currency: String {
    case USD = "USD"
    case EUR = "EUR"
    case BYN = "BYN"
}


func getExchangeRate(from: Currency, to: Currency) -> Double? {
    let usdToEurRate = 0.92
    let eurToUsdRate = 1.08
    let usdToBynRate: Double? = nil
    let bynToUsdRate = 0.31
    let eurToBynRate = 3.49
    let bynToEurRate = 0.28
    
if from == Currency.USD && to == Currency.EUR {
        return usdToEurRate
    } else if from == Currency.EUR && to == Currency.USD {
        return usdToBynRate
    } else if from == Currency.USD && to == Currency.BYN {
        return usdToBynRate
    } else if from == Currency.BYN && to == Currency.USD {
        return bynToUsdRate
    } else if from == Currency.EUR && to == Currency.BYN {
        return eurToBynRate
    } else if from == Currency.BYN && to == Currency.EUR {
        return bynToEurRate
    } else {
        return nil
    }
}

// TODO: Тебе не нужно получать 2 раза курс и перебирать еще раз все через if.
// Получаешь курс между двумя валютами и умножаешь его на amount, этого достаточно.
func convertCurrency(amount: Double, from: Currency, to: Currency) -> Double? {
    if let data = getExchangeRate(from: from, to: to) {
        let exchangeRate = getExchangeRate(from: from, to: to) ?? 0
        return amount * exchangeRate
    }
    print("Unable to convert. Rate unknown.")
    return nil
}
print(convertCurrency(amount: 34, from: Currency.BYN, to: Currency.EUR))

// MARK: Second task
enum Grade: Int {
    case A = 50
    case B = 40
    case C = 30
    case D = 20
    case F = 10
}
func getLetterGrade(score: Int) -> Grade? {
    switch score {
    case 40...50:
        return Grade.A
    case 30...39:
        return Grade.B
    case 20...29:
        return Grade.C
    case 10...19:
        return Grade.D
    case 0...9:
        return Grade.F
    default:
        return nil
    }
}

// TODO: Здесь такая же ошибка как и в курсах. Тебе во второй функции не нужно уже ничего перебирать.
// С помощью функции getLetterGrade ты уже получаешь готовую оценку. И если она не равна nil выводишь её.
func printExamResult(name: String, score: Int) -> String {
    if let data = getLetterGrade(score: score) {
        return name + " received " + String(describing: getLetterGrade(score: score)) + ": " + String(score)
    }
    return name + " got an invalid grade" + ": " + String(score)
}
print(printExamResult(name: "Alex", score: 23))
print(printExamResult(name: "Ilya", score: -2))

