import SwiftUI

//protocols:

protocol Vehicle{
    //have no function body
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle{
    func estimatedTime(for distance: Int) -> Int {
         distance/50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day!")
    }
    
}


//Protocols can be used as parameter types in Swift functions, allowing us to pass classes that conform to these protocols as arguments to these functions
func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimatedTime(for: distance) > 100 {
        print("That's too slow. I should use another vehicle.")
    }
    else{
        vehicle.travel(distance: distance)
    }
}

let car1 = Car()

commute(distance: 100, using: car1)

//opaque return types

func getRandomNumber() -> some Equatable{
    Int.random(in: 1...6)
}
func getRandomBool() -> some Equatable{
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())

//extensions
/*
 
 we are using extension for these advantages:
 - Code completion
 - Code organization
 - Internal access
 
 */

var quote = " The truth is rarely pure and never simple "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//we are creating an extension for "Strings"
extension String {
     func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
   mutating func trimmedDirectly(){
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)

    }
    
    var lines: [String]
    {
        self.components(separatedBy: .newlines)
    }
    
}
let trimmed2 = quote.trimmed()
quote.trimmedDirectly()

let lyrics = """
But i keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be allright
"""

print(lyrics.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    
}

extension Book{
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
//with extension initializer:
let lotr = Book(title:"Lord of The Rings" , pageCount: 1178)
//without extension initializer:
let lotr2 = Book(title: "Lord of The Rings", pageCount: 1178, readingHours: 250)

//Creating protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}



let guests = ["Mario", "George", "Joe"]

if guests.isNotEmpty{
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String {get}
    func sayHello()
}

extension Person {
    func sayHello(){
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person{
    let name: String
}

let george = Employee(name: "George Foreman")
george.sayHello()

//checkpoint 8

protocol Building{
    var rooms: Int {get}
    var cost: Int {get}
    var agentName: String {get set}
    func salesSummary()
}

extension Building{
    func salesSummary(){
        print("A property with \(rooms) rooms sold by \(agentName) and the price was \(cost)$.")
    }
}

class House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    init(rooms: Int, cost: Int, agentName: String) {
        self.rooms = rooms
        self.cost = cost
        self.agentName = agentName
    }
}

class Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    init(rooms: Int, cost: Int, agentName: String) {
        self.rooms = rooms
        self.cost = cost
        self.agentName = agentName
    }
}

let oneHouse = House(rooms: 10, cost: 10000, agentName:"WG-Gesucht")

oneHouse.salesSummary()
