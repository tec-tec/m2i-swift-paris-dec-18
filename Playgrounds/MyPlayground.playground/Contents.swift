import UIKit

var str = "Hello, playground"

var version = 4.2
let introduced = 2014

version = Double(introduced)

var testFloat: Float = 4.0

//version * testFloat

let a = 5
let b = 2
var c = Double(a) / Double(b)


c = 5.8

// On précise le type si ambiguité
let anotherVersion: Float = 4.0


var heartBeat = 60

// On précise si pas de valeur initiale fournie immédiatement
var isAlive: Bool = true

if heartBeat > 0 {
    isAlive = true
} else {
    isAlive = false
}

func eat(_ food: String, with friend: String) {
    print("Je mange avec \(food) with \(friend)")
}

eat("Pizza", with: "Paul")


func loadURL() -> (statusCode: Int, message: String) {
    //On essaye de charger une URL

    return (200, "OK")
}

let test = loadURL()
test.0

var nbHabitants = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

for truc in nbHabitants {
    print(truc.key)
}

