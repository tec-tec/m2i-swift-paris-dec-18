import UIKit

struct Dog {
    var age: Int = 0
    var name: String = ""
    var ownerName: String?

    func eat(quantity: Int) {

    }
}

let aDog = Dog(age: 3, name: "Médor", ownerName: "Ludovic")
var anotherDog = Dog()
anotherDog.name = "Brutus"

class Animal {
    var age: Int = 0
    var name: String = ""
}

class Cat: Animal {

    static var lifeEsperance = 15

    private var ownerName: String?
    var humanLikeAge: Int {
        return age * 7
    }

    func eat(quantity: Int) {

    }

    func sayOwnerName() {
        print(ownerName)
    }
}

let aCat = Cat()
aCat.name = "Félix"
print(aCat.name)
let humanAge = aCat.humanLikeAge

if aCat.age > Cat.lifeEsperance {
    // Good bye Cat
}

for i in 0...10 {
    aCat.age = i
    aCat.age
}
//aCat = Cat()

var cities = ["Paris", "Bordeaux", "Marseille"]
cities.reversed()

extension Array {
//
//    func random() -> Element? {
//        return self.randomElement()
//    }

    var random: Element? {
        return self.randomElement()
    }
}

//cities.random

struct Point {
    var x: Float
    var y: Float
}

struct Size {
    var width: Float
    var height: Float
}

struct Rect {
    var origin: Point
    var size: Size
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }

        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var myRect = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
myRect.center

myRect.center = Point(x: 10, y: 10)

myRect.origin


//UIColor.blue




