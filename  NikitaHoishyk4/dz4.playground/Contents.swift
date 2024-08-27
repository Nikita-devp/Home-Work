import UIKit

//дз1
func ik() {
    print("Hello World")
}
ik()

func ik2(_ name: String) {
    print("Hello, \(name)")
}
ik2("Zlata")

func ik3(with name: String) -> String {
    return "Hello \(name)"
}
ik3(with: "Zlata")

//дз2
func char(value1: String, value2: String) -> Int {
    return value1.count + value2.count
}
char(value1: "car", value2: "dog")

// дз3
func ik4(with a: Int) {
    let square = a * a
    print(square)
}
ik4(with: 5)



//дз5
func crug(radius: Int, pi: Double = 3.14) -> Double {
    let k1: Double = pi * Double(radius)
    return k1
}
crug(radius: 4)

//дз6

func daynight(night: Bool) -> String {
    let n1: String = night ? "ночь" : "не ночь"
    return n1
}
daynight(night: true)


//дз8

enum Seasons: String {
    case winter = "Зима"
    case autumn = "Осень"
    case summer = "Лето"
    case spring = "Весна"
    

}

func season(with monthNumber: Int) -> String {
    switch monthNumber {
    case 12,1,2:
        return Seasons.winter.rawValue
    case 3...5:
        return Seasons.spring.rawValue
    case 6...8:
        return Seasons.summer.rawValue
    case 9...11:
        return Seasons.autumn.rawValue
    default:
        return "Error"
    }
}
season(with: 9)

//дз9

func factorial(value: Int) -> Int {
    if value == 0 {
        return 1
    } else {
        return value * factorial(value: value - 1)
    }
}
factorial(value: 5)






/// enfuenjifneoiwfnw
func ka(a: Int, b: Int) -> Int {
    
    return a + b
}
let u = ka(a: 124, b: 110)

let o = ka(a: 30, b: 100)


func names(name: String, day: String) -> String {
    return "Привет, \(name) сегодня пиздатый \(day) и тебе сегодня"
}

let i = names(name: "kirill", day: "monday")



func rekursive(name: String,
               day: String,
               type: inout Int 
)
{
    if type > 0 {
        print(names(name: name, day: day))
        type -= 1
        rekursive(name: name, day: day, type: &type)
    }
}
var tires: Int = 10
rekursive(name: "kirill", day: "monday", type: &tires)
print(tires)
