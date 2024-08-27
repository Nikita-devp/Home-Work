import UIKit

class person {
    let FirstName: String
    let SecondName: String
    let clase: Int
    
    init(FirstName: String,
         SecondName: String,
         clase: Int
    ){
        self.FirstName = FirstName
        self.SecondName = SecondName
        self.clase = clase
    }
    func fullName() {
        print(self.FirstName)
    }
    func fullName1() {
        print(self.FirstName)
    }
    func clas() {
        print(self.FirstName)
    }
}

let student1: person = .init(FirstName: "Petrov", SecondName: "Nikita", clase: 7)

let student2: person = .init(FirstName: "Badrov", SecondName: "Andrey", clase: 9)

let student3: person = .init(FirstName: "Ivanov", SecondName: "Evgeny", clase: 11)

let student4: person = .init(FirstName: "Tonkih", SecondName: "Ruslan", clase: 11)

class Director: person {
    override func  fullName() {
        print(self.FirstName)
    }
    override func fullName1() {
        print(self.FirstName)
    }
    
    let age: Int
    let surname: String
    let experience: Int
    
    func Director() {
        print(self.age)
    }
    func Director2() {
        print(self.surname)
    }
    func Director3() {
        print(self.experience)
    }
    
    
    
    init(age: Int,
         surname: String,
         experience: Int
    ){
        self.age = age
        self.surname = surname
        self.experience = experience
        super.init(FirstName: "Fedorov", SecondName: "Vladimir", clase: 1)
        
    }
}


let DirectorShool: Director = .init(age: 57, surname: "Fedorov Vladimir", experience: 37)

class lesson {
    let History: String
    let math: String
    let language: String
    let geography: String
    
    
    init( History: String,
          math: String,
          language: String,
          geography: String )
    {
        self.History = History
        self.geography = geography
        self.language = language
        self.math = math
    }
}

struct Adres {
    let cordX: Double
    let cordY: Double
    let streetName: String
    
    init(cordX: Double, cordY: Double, streetName: String) {
        self.cordX = cordX
        self.cordY = cordY
        self.streetName = streetName
    }
    
    class shool {
        let person: [person]
        let shoolAdres: Adres
        let shoolName: String
        
        init(person: [person], shoolAdres: Adres, shoolName: String) {
            self.person = person
            self.shoolAdres = shoolAdres
            self.shoolName = shoolName
        }
        
        
        func shoolInfo() {
            print("this is the \(shoolName) school and it is located at \(shoolAdres)")
            
        }
    }
    
    let scole: shool = shool(person: [student1, student2, student3, student4], shoolAdres: Adres(cordX: 124.2353, cordY: 124124.8765, streetName: "slavinskaga 12"), shoolName: "TMcool")
}

