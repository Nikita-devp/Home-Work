import UIKit

var greeting = "Hello, playground"

class person{
    
    let Firstname: String
    
    let name: String
    
    let age: Int
    
    private var apart: [apartment] = []
    
    init(Firstname: String, age: Int, name: String ){
        self.name = name
        self.Firstname = Firstname
        self.age = age
        print("все гуд")
    }
    
    func addApart(_ aparts: apartment){
        apart.append(aparts)
    }
    
    deinit{
        print("краш")
    }
}


class apartment{
    
    let price: Int
    
    let adress: String
    
    weak var owner: person?
    
    init(price: Int, adress: String, owner: person? = nil) {
        self.price = price
        self.adress = adress
        self.owner = owner
        
        print("Все гуд")
    }
    
    deinit{
        print("Crash")
    }
}

let Person = person(Firstname: "Hoishik", age: 22, name: "Nikita")

let Price = apartment(price: 270, adress: "Minsk, Slavinskaga street, home number 29/10, Flat 10", owner: Person)
