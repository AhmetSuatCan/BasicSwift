import SwiftUI
// Optionals

let opposites = ["Mario": "Wario", "Luigi":"Waluigi"]

let peachOpposite: String? = opposites["Mario"]

//unwrapping the optional
if let unwrappedName = peachOpposite {
    print("We have an opposite: \(unwrappedName)")
}else{
    print("we don't have any optional")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
    
}else{
    print("This is not a real Integer")
}

//unwrap optionals with guard
func printSquare(of number: Int?){
    //it's basicly the opposite of unwraping optional.
    guard let number = number else{
        print("missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

//unwrap optionals with nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager":"Janeway",
    "Defiant":"Sisko",
    
]
//this won't be an optional string
let new = captains ["Serenity"] ?? "N/A"

print(new)


//handling multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")
 

//handling function failure with optionals
enum UserError: Error{
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23){
    print("User: \(user)")
}

//checkpoint 9

func randomElement2(from numbers: [Int]?) ->Int{
    
    numbers?.randomElement() ?? Int.random(in: 1...100)
}


var optionalIntArray: [Int]? = nil

print(randomElement2(from: optionalIntArray))
