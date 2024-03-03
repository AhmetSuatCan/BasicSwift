

//Variables

//--------------------------------

// means "variable" and this kind of variable can be changed.
var greeting = "Hello, World!"
var name = "ahmet"
print(name)
name = "serhat"
print(name)
name = "mehmet"
print(name)

//constant variables and cannot be changed.
let secondName = "suat"

let managerName = "Michael"

let dogBreed = "presa canario"

//try to create let instead of var as much as possible.

//strings

//--------------------------------

let actor = "Jennifer Lawrence"

//you can use "  inside your string but you need use \ before
let word = "He said  that \"I believe you can do it\" with all his honest."

//linebreaks are not allowed normally. You should use special syntax

let movie = """
The good
The bad
and the ugly
"""
let nameLength = actor.count

print(word.uppercased())

print(movie.hasPrefix("The"))

print(dogBreed.hasSuffix("canario"))


// Whole Numbers

//--------------------------------

//you can seperate number with "_"
let number = 100_000_000
//swift ignores the "_"'s
//number = number2

let number2 = 100000000

let score = 10
let highscore = 10*2
let lowescore = 10/2

var counter = 10

 counter += 20
 counter -= 5
counter  *= 10

print(counter)


let Nmber = 120

print(Nmber.isMultiple(of: 3))


//store decimal numbers

//--------------------------------


//swift is type-safe so you can't make operations with int and for example double

//you should align data types

let a = 1

let b = 2.0




//let c = a+b  --> this would cause an error. Instead of this you should type:
let c = Double(a)+b

//boolean
//--------------------------------

let goodMan = true
var gameOver = false
//toggles boolean types. true --> false | false --> true
gameOver.toggle()
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated

print(isAuthenticated)

//joining strings

let firstPart = "Hello,"
let secondPart = "World"
let message = firstPart + secondPart

print(message)

let people = "haters"
let gonna =  "hate"

let msg = people + " gonna " + gonna

print(msg)

//string interpolation:

let nameMusician = "Taylor"

let age = 26

let ms = "hello, my name is \(nameMusician) and i'm \(age) years old"



print(ms)


//checkpoint

//create a constant holds a celcius degree
// to transform the celcius to fahrenheit, multiply by 9, divide by 5 then add 32

let celcius = 10.0

var fahrenheit = ((celcius*9.0)/5.0) + 32.0

print("the celcius degree is \(celcius) and the Fahrenheit equivalent of this degree is \(fahrenheit)")


//arrays

var beatles = ["john", "Paul", "George", "Ringo"]
//adds another element to array. Adds new element at the end of the array.
beatles.append("Mehmet Ali Erbil")
//you should add the same data type of the array.

print(beatles)

var numbers = [1 , 3 , 4 , 5]

print(numbers[0])

//another syntax for array declerations (with data type) & with  "( )" you can customize your array.
var scores = Array<Int>()

scores.append(1)
scores.append(20)
scores.append(15)

print(scores)

//another way for array declerations (with data types)
var albums = [String]()
//Swift can figure out the data type if you give the initial value:
var films = ["Mission Impossible"]
films.append("Kurtlar Vadisi Irak")
films.append("Recep İvedik")
films.append("Oppenheimer")

print(films)
print(films.count)
films.remove(at: 2)
print(films)
//films.removeAll()
print(films)

//containing an element control

print(films.contains("Batman")) //returns boolean

films.sorted()
let reversedFilms = films.reversed()

print(reversedFilms)

print(films)


albums.append("Gurbet")
albums.append("Sanat")

//print(albums)



//Dictionaries:

let employee = [
    "name" : "Ahmet Suat Can",
    "job"  : "iOS Developer",
    "Location": "Elazığ",

]

print(employee["name", default: "Unknown"])
print(employee["password", default: "Unknown"])

let hasGratuated = [
    "Eric" : false,
    "Otis" : false,
    "Meave": true
]

let olympics = [
    2012 : "London",
    2016 : "Rio de Janeiro",
    2020 : "Tokyo",
]

//Changable dictionary decleration
var heights = [String : Int]()

//Setting a row for dictionary.
heights["Ahmet Suat Can"] = 170

heights["George Foreman"] = 191

print(heights)




//SETS

var actors = Set(["Denzel Washington", "Samuel l Jackson", "Al Pacino", "Al Pacino"])

print(actors)

//you can't append any items because there isn't any sorted value. Instead of append, you use "insert":

actors.insert("Nicholas Cage")

print(actors)

//Another decleretion syntax for sets

//Creates an empty set
var actors2 = Set<String>()

//inserting an item to set
actors2.insert("Necati Şaşmaz")
actors2.insert("Gürkan Uygun")
actors2.insert("Kenan Çoban")
//don't you forget, a set wouldn't store same items.
actors2.insert("Necati Şaşmaz")

print(actors2)
    


//enumerations

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday "

enum weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = weekday.tuesday

//once you declared enum, you don't have to use "enum" name.
day = .thursday



