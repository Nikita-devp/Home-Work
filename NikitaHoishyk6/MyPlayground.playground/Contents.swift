import UIKit
// Задание 1
var massive1: [Int] = Array(0...14)

var massive2: [Int] = Array(15...30)


var massivetop: [Int] = massive1 + massive2
print(massivetop)

//Задание 2
func sum(massive1: [Int]) -> [Int] {
    return massive1.map {$0 * $0}
}
print(sum(massive1: massive1))

// Задание 3

func evenNumbers(massive2: [Int]) -> [Int] {
    return massive2.filter{ $0 % 2 == 0}
}

print(evenNumbers(massive2: massive2))

// Задание 4

var massiveword: [String] = ["Nikita", "Zlata", "Eva" ]

func sumword(massiveword: [String]) -> [String] {
    return massiveword.map {$0}
}

print(sumword(massiveword: massiveword))

///222

var numbers: [Int] = [2, 2, 5, 7, 8, 4, 6, 3, 7, 8, 5, 3, 1, 8, 6]

print(numbers.filter{ $0 <= 2})
let nums = numbers.filter { number in
    return number <= 2
}

var numbers1: [Int?] = [2, 2, 5, 7, 8, nil, nil, 4, 6, 3, 7, 8, 5, nil, 3, 1, 8, 6]

numbers1.compactMap { numbers1 -> Int? in
    if let numbers1, numbers1 > 0 {
        return nil
    } else {
        return numbers1
    }
}

let numbers2 = ["2", "mary", "many", "13", "1337", "frady", "night"]

let compmap = numbers2.compactMap({ Int($0) })

print(compmap)



let allmassive = [[3, 1930, 124], [098, 375,852], [333, 111, 222, 444], [1, 2, 3]]
let result =  allmassive.flatMap({$0})
 print(result)


var mmm = [-123, 241, -654, 99, -145, 91]
mmm.sort(by: <)
print(mmm)

var mmm2 = [123, -123, -9824, -12, -576, 248, 123, 824]
mmm2.sort(by: > )
print(mmm2)


var mmm3 = [13, 23, -9824, -12, -576, -248, 123, 870]
mmm3.sort(by: > )
print(mmm3)

var mmm4 = [-75, 87, 15, -990, 7856, 675, -759]
mmm4.sorted(by: <)
print(mmm4)
