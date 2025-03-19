import UIKit
// MARK: Task 1
class Shape {
    let color: String
    
    init(color: String) {
        self.color = color
    }
    
    func calculateArea() -> Double? {
        print("This method must be overriden in a subclass")
        return nil
    }
}

class Circle: Shape {
    let radius: Double
    
    init(color: String, radius: Double) {
        self.radius = radius
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return Double.pi * pow(radius ,2)
    }
}

class Rectangle: Shape {
    let length: Double
    let width: Double
    
    init(color: String, length: Double, width: Double) {
        self.length = length
        self.width = width
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return length * width
    }
}

class Triangle: Shape {
    let heightOfTriangle: Double
    let sideOfTriangle: Double
    
    init(color: String, heighOfTriangle: Double, sideOfTriangle: Double) {
        self.heightOfTriangle = heighOfTriangle
        self.sideOfTriangle = sideOfTriangle
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return heightOfTriangle * sideOfTriangle / 2
    }
}

let arrayOfShapes: [Shape] = [
    Circle(color: "white", radius: 7.7),
    Rectangle(color: "red", length: 23, width: 4),
    Triangle(color: "green", heighOfTriangle: 3, sideOfTriangle: 8.7)
]

arrayOfShapes.forEach { element in
    print(element.calculateArea() ?? 0)
}

//MARK: Task 2
struct Contact {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String?
}

let contacts: [Contact] = [
    Contact(firstName: "Ilya", lastName: "Stepanenko", phoneNumber: "+375447330585", email: "ilyastep99@gmail.com"),
    Contact(firstName: "Dmitri", lastName: "Prutkevich", phoneNumber: "+375291234567", email: nil),
    Contact(firstName: "Katsiaryna", lastName: "Popko", phoneNumber: "+000000000000", email: "katsiaryna.popko@gmail.com"),
    Contact(firstName: "Kate", lastName: "Jackson", phoneNumber: "+12345678901", email: "kate.jackson@gmail.com")
]

func findingContact(contacts: [Contact], searchString: String) -> [Contact] {
    return contacts.filter {
        ($0.firstName + $0.lastName).uppercased() == searchString.uppercased()
    }
}

print(findingContact(contacts: contacts, searchString: "KateJackson"))
