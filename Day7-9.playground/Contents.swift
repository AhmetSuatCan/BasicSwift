
import SwiftUI

//Function
let root = sqrt(196)

print(root)


func helloWorld(){
    print("Hello World!")
}

func printTimesTable(number: Int, end: Int){
    
    for i in 1...12{
        print("\(i) * \(number) is \(number * i)")
        
    }
}

//in Swift, you should write the parameter name to pass an argument.

//printTimesTable(number: 5, end: 20)


func rollDice() -> Int {
    return Int.random(in: 1...20);
}

print(rollDice())

func StringControl(this: String, equalsTo:String) -> Bool{
//We don't have to use "return" keyword for 1 line of code.
    this.sorted() ==  equalsTo.sorted()
}

let str1 = "Yes"
let str2 = "No"

print(StringControl(this: str1, equalsTo: str2))

func hypotenus(line1: Double, line2: Double) -> Double {
    sqrt((line1*line1) + (line2*line2))
}


print(hypotenus(line1: 5, line2: 5))

//in void functions, you can use "return" keyword to exit from function immediately

func hello(){
    return
}

//return multiple values from function:

//with arrays
func getUser() -> [String]{
    ["Taylor", "Swift"]
}

//with dictionaries
func getUserD() -> [String: String]{
    ["name":"George", "surname": "Foreman"]
}

//with tuples
func getUserT() ->(firstName: String, lastName:String){
    (firstName:"George", lastName: "Foreman")
}


//Overloading
func hireEmployee(name: String){
    
}
func hireEmployee(title: String){
    
}
func hireEmployee(location: String){
    
}

let word = "This is it."
print(word.hasPrefix("This"))

//without naming parameter
func isUppercase(_ string: String) -> Bool{
    string == string.uppercased()
}

let string = "HELLO,WORLD"
let result = isUppercase(string)

//you can name your parameter with 2 names. One for passing argument and the other for using parameter in your function body.
func printTimeTables(for number : Int){
    for i in 1...12{
        print("\(i) x \(number) is \(i * number)")
    }
    
}
printTimeTables(for: 5)

//providing default values for parameters

func printTimeTables2(for number: Int, end: Int = 12){
    for i in 1...end{
        print("\(i) x \(number) is \(i * number)")
    }
    
}

printTimeTables2(for: 5)
printTimeTables2(for: 5, end: 20)

//an example for default value parameters

var characters = ["George", "Lennox","Joe","Earnie"]
print(characters.count)
//doesn't erase the memory capacity of string.
characters.removeAll(keepingCapacity: true)
print(characters.count)


//error handling

enum passwordError: Error{
    case short, obvious
}

func checkPassword(_ password: String) throws->String{
    
    if password.count < 5 {
        throw passwordError.short
    }
    if password == "12345"{
        throw passwordError.obvious
    }
    if password.count < 8 {
        return "OK"
    }
    if password.count < 10 {
        return "good"
    }
    else {
        return "Excellent"
    }
}

let stringpw = "12345"

do{
    let result = try checkPassword(stringpw)
    print("Password rating: \(result)")
} catch passwordError.short{
    print("Please use a longer password.")
} catch passwordError.obvious{
    print("I have the same combination on my luggage!")
} catch{
    print("There was an error.")
}

//checkpoint 4
enum numberError : Error{
    case lessThanOne, moreThanTenThousand, notIntRoot
}
func squareRoot(_ number: Double) throws -> String{
    if number < 1 { throw numberError.lessThanOne
    }
    if number > 10_000{ throw numberError.moreThanTenThousand
        
    }
    //approaching this problem with the "Babil Method"
    //You should take an initial guess and do several iterative calculation.
    var guess : Double = 1.0
    
    //trying to find nearest guess. which is square root of number + 1
    for i in 1...Int(number){
        if Double(i*i) == number + 1{ guess = Double(i*i)
            break}
        
    }
   //50 steps would be enough for most of the numbers.
    for i in 1...50 {
        //approaching the real value with the formula:
        guess = ((guess + (number/guess))/2)
        
    }
    if guess != Double(Int(guess)){
        throw numberError.notIntRoot
    }
    
    return "The answer is: \(guess)"
    

        
        
}

let number : Double = 100
do{
    let result = try squareRoot(number)
    print(result)
}
catch numberError.lessThanOne{ print("Please type a number that bigger than 1")}
catch numberError.moreThanTenThousand{ print("Please type a number that less than 10.000")}
catch numberError.notIntRoot{
    print("no root found.")
}
catch {
    print("there was an error")
}


//Closures

func greetUser(){
    print("hello World")
    
}

//Copying the function (Closure)
var greetCopy = greetUser

greetCopy()



//Creating closure:
let sayHello = { (name: String) -> String in //in keyword let's us know that "function declaration" is ended and with that, we know after the "in" keyword, the body of function comes.
    "Hi!\(name)"
    
}

sayHello("ahmet")

//type annotation explicitly

//no parameters, no returns. Just like "void() in java."
var greetCopy2 : () -> Void = greetUser

func getUserNameByID(for id: Int) -> String {
    if id == 1962 {
        return "George"
    }else{
        return "Anonymous"
    }
}

let getUser2: (Int) -> String = getUserNameByID


//we don't use parameter names for closures.
print(getUser2(2005))

let team = ["Gloria", "Suzanne","Piper","Tiffany","Tasha"]

let sortedTeam = team.sorted()

print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool{
    if name1 == "Suzanne"{
        return true
    } else if name2 == "Suzanne"{
        return false
    }
    
    return name1 < name2
    
    
}

//trailing closure syntax

// don't use name1 or name2. Swift provides default parameter names "$0,$1"
let sortedTeam2 = team.sorted {
    if $0 == "Suzanne"{
        return true
    } else if $1 == "Suzanne"{
        return false
    }
    
    return $0 < $1
}
    
//Functions that accepting functions as parameters

func makeArray(size:Int, using generator: () ->Int) ->[Int]{
    var numbers = [Int]()
    
    for _ in 0...size{
        
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers;
}


let numbers = makeArray(size: 50){
    Int.random(in: 1...20)
}

print(numbers)


func doImportantWorks(first: () -> Void,second: () -> Void,third:() -> Void){
    print("First work is starting")
    first()
    print("Second work is starting")
    second()
    print("last work is starting")
    third()
}


//Multiple function parameters
doImportantWorks{
    print("This is the first work.")
}second:{print("this is the second work.")
}third: {
    print("This is the last work.")
}

//checkpoint 5

let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]

let LuckyNumbersModified = luckyNumbers.filter{
    if $0 % 2 == 0{
        return false
    }else{
        return true
    }
}.sorted {
    return $0 > $1
}.map{
    return "\($0) is lucky number!"
}

for i in 0...LuckyNumbersModified.count-1{
    
    print(LuckyNumbersModified[i])
}



