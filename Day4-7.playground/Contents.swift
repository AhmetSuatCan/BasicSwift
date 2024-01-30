//type annotations

let surname: String = "Lincoln"
let score: Double = 0
let score2: Int = 10

var albums : [String] = ["a","b","c"]

var users : [String: String] = ["id" : "220541009"]

//declare without initial value
var teams : [String] = [String]()
var cities : [String] = []

enum UIstyle{
    case light, dark, system
}
var style = UIstyle.light
style = .dark


let username : String

username = "Asc"

print(username)

//checkpoint 2

let names : [String] = ["George", "Mike", "Evander", "Lennox","Lennox","Mike"]

print(names)
print(names.count)

let setNames = Set(names)

print(setNames)
print(setNames.count)


//-----------------------------------------------------
//-----------------------------------------------------



//conditions

let conditionalScore = 85
let isPlayer = false

if conditionalScore > 80 && isPlayer {
    
    print("You've done well")
}else{
    print("Sorry, failed.")
}

var numbers = [1,2,3]

numbers.append(5)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)


let country = "Germany"

if country != "France"{
    print("correct")
}else{
    print("wrong")
}

var username1 = "swift123"


if username1.isEmpty {
print("invalid")
}
print("Welcome \(username1)")

//-----------------------------------------------------
//-----------------------------------------------------


//Switch statement:

let Weekdays = "tuesday"

switch Weekdays{
case "monday":
    print("Pazartesi")
    fallthrough
case "tuesday":
    print("Salı")
    fallthrough
case "wednesday":
    print("Çarşamba")
    fallthrough
case "thursday":
    print("Perşembe")
    fallthrough
case "friday":
    print("Cuma")
    fallthrough
case "saturday":
    print("Cumartesi")
    fallthrough
case "sunday":
    print("Pazar")
    fallthrough
    
default:
    print("Not found")
}

//Ternary operator

let age = 18

let canVote = age >= 18 ? true : false

print("""
-----------------------------
-----------------------------
""")

// For-Loop

let platforms = ["iOS", "macOS", "tvOS","watchOS"]


for os in platforms {
    print("Swift works great on \(os)!")
    
}

for i in 1...12{
    print("5 x \(i) = \(5*i)")
}

for i in 1..<5 {
    print("Counting from 1 through 4: \(i)")
}

for _ in 1...5{
    print("Hello World!")
}

//While-loop

var countdown = 10

while countdown > 0 {
    print("Continue")
    countdown -= 1
    print(countdown)
}
print("over")

let id = Int.random(in: 1...100)

print(id)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("rolled \(roll)")
};  print("critical hit!")


//skipping loops

let files = ["weather.jpg", "word.docx","front.jpg", "letter.txt", "malcolm.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        
        
        if file.hasSuffix(".txt") == true {
            print("Oh! we found a text! : \(file)")
            print("Our code is broken now...")
            break
        }
        continue
    }

    print("We found picture!: \(file)")
}

//checkpoint 3

for i in 1...100 {
    
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    }else if i % 5 == 0 {
        print("Buzz")
    }else{
        print(i)
        
    }
}









