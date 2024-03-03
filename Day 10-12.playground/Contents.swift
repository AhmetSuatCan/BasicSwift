import SwiftUI
//Structs
//Capital letter is always uppercased
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) (\(year)) by \(artist)")
     }
}


//Creating an instance of a struct
let red = Album(title: "Red", artist: "Taylor Swift", year:  2016)

print(red.title)

red.printSummary()


struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    //computed properties
    var vacationRemaining: Int{
        get{
            vacationAllocated-vacationTaken
        }
        set{
            vacationAllocated = vacationTaken + newValue
        }
            
    }
    //mutating keyword is for being able to change some property in structs
     mutating func takeVacation(days: Int){
        if vacationRemaining > days {
            
            vacationTaken += days
            print("im going on vacation!")
            print("Vacation remaining: \(vacationRemaining)")
        }else{
            print("Oops! There aren't enough days remaining.")
        }
        
    }
}

var employee = Employee(name: "George Foreman", vacationAllocated: 20)

//Even with the 'mutating' keyword, you cannot change an instance of a struct that was created with the 'let' keyword.
employee.takeVacation(days: 5)

employee.takeVacation(days: 10)




struct score {
    var score = 0{
        didSet{
            print("Score is now: \(score)")
            print("Previous turn, Score was: \(oldValue)")
        }
        willSet{
            print("Well, score is changing... Old score was \(score)")
            print("New score is: \(newValue)")
        }
    }
     
}
var game1 = score()

game1.score = 25

//custom initializers
struct Player{
    private var id: Int
    let name: String
    let number: Int
    
    //Returns only struct itself
    init(name: String, number: Int) {
        //"Self" is simply "this" keyword in Java
        self.name = name
        self.number = number
        self.id = 12345
        print("Player created")
    }
}

let player1 = Player(name: "Ahmet", number: 1)

//we can use access modifiers in structs attributes.
//player1.id = 200
//code didn't worked because we used "private" keyword for that property.
//fileprivate : don't let anything outside the current file use this.
//private(set) : you can read but you can't change

//static properties and methods

struct School {
    static var studentCount = 0
    static func add(student: String){
        print("\(student) joined the school.")
        studentCount += 1
    }
}

//You can access static elements directly from struct itself. You don't have to create an Instance.


struct Car{
    private let model: String
    private let numberOfSeats: Int
    private let numberOfGears: Int
    private var currentGear = 0;
    
    init(model: String, numberOfSeats: Int, numberOfGears: Int, currentGear: Int = 0) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        
        if numberOfGears <= 12 {
            self.numberOfGears = numberOfGears
        } else
        {
            print("The maximum capacity of gears is 12")
            self.numberOfGears = 12
        }
            
        self.currentGear = currentGear
    }
    
    mutating func gearUp(){
        if currentGear >= numberOfGears{
            print("You've reached highest gear")
        } else
        {
            currentGear += 1
            print("Gear changed")
        }
    }
   mutating func gearDown(){
        if currentGear <= -1 {
            print("You've reached reverse gear. You can't down your gear anymore.")
        } else
        {
            currentGear -= 1
        }
            
    }
    
}


//CLASSES

class Game{
    var score: Int{
        didSet{
            print("Score is now changed \(score)")
        }
    }
    init(score: Int) {
        self.score = score
    }
}

var newGame = Game(score: 20)

newGame.score = 10


class Workers {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary(){
        print("working \(hours)")
    }
}

class Developer: Workers{
    func work(){
        print("Writing code for \(hours) hours...")
    }
    
    override func printSummary() {
        print("im a developer and writing code in a day for around \(hours) hours.")
    }
}

class Manager: Workers {
    
    func work() {
        print("Managing for \(hours) hour.")
    }
    override func printSummary() {
        print("im a Manager and making some plans in a day for around \(hours) hours.")
    }
}


let robert = Developer(hours: 10)
let michael = Manager(hours:  20)

robert.work()
michael.work()


//super init

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Cars: Vehicle  {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
        
    }
    
}

//copying classes

class   User{
    var name = "Anonymous"
    
    func copy() -> User{
        let user = User()
        user.name = name
        return user
        
    }
    deinit{
        //deinitializers starts when the last data that points the object deleted.
    }
    
}
var user1 = User()
var user2 = user1

//Change both
user2.name = "Joe"

//to change only the copy. We need to use copy() method.
var user3 = user2.copy()

user3.name = "Earnie"

print(user2.name)
print(user1.name)
print(user3.name)

//Checkpoint 7:

class Animal{
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak(){
        print("Animal voices")
    }
}

class Dog: Animal{
    override func speak(){
        print("woof! whoof! woof!!")
    }
    
     init() {
        super.init(legs: 4)
    }
}

class Cat: Animal{
    var isTame: Bool = true
    override func speak() {
        print("meow meow meow...")
    }
    init() {
        super.init(legs: 4)
        
    }
}

class Corgi: Dog{
    
}
class Poodle: Dog{
    
}
class Persian: Cat{
    
}
class Lion: Cat{
    
}
