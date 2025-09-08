import UIKit

let mas : [Int] = [1, 2, 3, 4, -5, 6]

func func1() -> [String] {
    var mas1 : [Int] = []
    for each in mas {
        if each > 0 {
            if each % 2 == 0 {
                mas1.append((each * 2))
            } }
    }
        var mas2 : [String] = mas1.map { String($0) }
    
    return mas2
}

print(func1())

func func2() -> [String] {
    var mas1 : [Int] = []
    for i in mas {
        if i > 0 {
            if i % 2 == 0 {
                mas1.append((i * 2))
            }
        }
    }
    var mas2 : [String] = []
    
    for i in mas1 {
        mas2.append(String(i))
    }
    
    return mas2
}

print(func2())


