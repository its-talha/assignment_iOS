import UIKit
//Q1:-What is Error Protocol. Create a custom error conforming to error protocol.
//Sol: Error Protocol is just a type for representing error values that can be thrown. Swift requires you to create a custom Error type. Typically an Enum is used which conforms to the Error Protocol.

//enum CustomError: Error {
//    // Throw when an invalid password is entered
//    case invalidPassword
//
//    // Throw when an expected resource is not found
//    case notFound
//}
//
//let currPass = "12345bji"
//
//func checkPass(pass : String)throws -> Bool{
//
//    if(currPass == pass){
//        return true
//    }else{
//        if(pass == ""){
//            throw CustomError.notFound
//        }
//        throw CustomError.invalidPassword
//    }
//}

//Q2:- Write a failable initialiser for a class which throws a error  “Object not able to initialise” description a initialisationFailed case, Catch the error and print its error description.
//Sol:
//enum nameError: Error {
//    // Throw when an object initialisation is failed
//    case initialisationfailed
//}
//extension nameError : LocalizedError{
//
//    public var errorDescription: String? {
//            switch self {
//            case .initialisationfailed:
//                return NSLocalizedString("Error : Object not able to initailise", comment: "Invalid initialisation of object")
//            }
//    }
//}
//
//class ShowError{
//    let major : String
//    init?(string : String)throws {
//
//        if string == ""{
//            throw nameError.initialisationfailed
//        }else{
//            self.major = string
//            print("Object initailised")
//        }
//    }
//}
//
//
//do {
//    var obj = try ShowError(string: "")
//}catch{
//    print(error.localizedDescription)
//}

/*Q3:-Explain the difference try, try?, try! , make sure to write a program to explain the difference.
Sol:
 try : The try keyword is used to indicate that a method can throw an error. To catch and handle an error, the throwing method call needs to be wrapped in a do-catch statement.

 try? : The try? specifies that If we use the try? keyword and an error is thrown, the error is handled by turning it into an optional value. This means that there is no need to wrap the throwing method call in a do-catch statement.
 
 try! : an exclamation mark always serves as a warning sign. By appending an exclamation mark to the try keyword, error propagation is disabled.This means that, if an error does get thrown, your application crashes as the result of a runtime error
 */

enum ThrowableError: Error {

    case badError(howBad: Int)
}

func doSomething(everythingIsFine: Bool = false) throws -> String {

  if everythingIsFine {
      return "Everything is ok"
  } else {
      throw ThrowableError.badError(howBad: 4)
  }
}


//example of try
do {
    let result1 = try doSomething()
}
catch ThrowableError.badError(let howBad) {
    // Here you know about the error
    // Feel free to handle or to re-throw

    // Handle
    print("Bad Error (How Bad Level: \(howBad)")

}

//example of try!
let result2 = try! doSomething()


//example of try?
if let result3 = try? doSomething() {
    // doSomething succeeded, and result is unwrapped.
    print("Everything is working fine")
} else {
    // Ouch, doSomething() threw an error.
    print("Error!! caught" )
}


//Q4:-Write a program which loads the data from a datasource of 10 employees looks like below, Program would help to give salary bonus to employees. Which is based on some conditions but if employee is not able to satisfy the condition program should throw the error with specific error condition and its description should be printed.
//Sol:

