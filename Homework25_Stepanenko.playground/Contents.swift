class Person {
    let name: String
    let age: Int
    var apartment: Apartment?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("Person \(name) создан.")
    }
    
    deinit {
        print("Person \(name) удален из памяти.")
    }
}

class Apartment {
    let address: String
    let rent: Double
    weak var tenant: Person?
    
    init(address: String, rent: Double) {
        self.address = address
        self.rent = rent
        print("Apartment по адресу \(address) создан.")
    }
    
    deinit {
        print("Apartment по адресу \(address) удален из памяти.")
    }
}


var person1: Person? = Person(name: "Иван", age: 30)
var person2: Person? = Person(name: "Анна", age: 25)
var apartment1: Apartment? = Apartment(address: "ул. Калиновского, 10", rent: 500)
var apartment2: Apartment? = Apartment(address: "ул. Купалы, 15", rent: 600)


person1?.apartment = apartment1
apartment1?.tenant = person1

person2?.apartment = apartment2
apartment2?.tenant = person2


person1 = nil
apartment1 = nil

person2 = nil
apartment2 = nil

