import UIKit
//Q1:-What is Error Protocol. Create a custom error conforming to error protocol.
//Sol: Error Protocol is just a type for representing error values that can be thrown. Swift requires you to create a custom Error type. Typically an Enum is used which conforms to the Error Protocol.

enum CustomError: Error {
    // Throw when an invalid password is entered
    case invalidPassword

    // Throw when an expected resource is not found
    case notFound
}

let currPass = "12345bji"

func checkPass(pass : String)throws -> Bool{

    if(currPass == pass){
        return true
    }else{
        if(pass == ""){
            throw CustomError.notFound
        }
        throw CustomError.invalidPassword
    }
}

//Q2:- Write a failable initialiser for a class which throws a error  “Object not able to initialise” description a initialisationFailed case, Catch the error and print its error description.
//Sol:
enum nameError: Error {
    // Throw when an object initialisation is failed
    case initialisationfailed
}
extension nameError : LocalizedError{

    public var errorDescription: String? {
            switch self {
            case .initialisationfailed:
                return NSLocalizedString("Error : Object not able to initailise", comment: "Invalid initialisation of object")
            }
    }
}

class ShowError{
    let major : String
    init?(string : String)throws {

        if string == ""{
            throw nameError.initialisationfailed
        }else{
            self.major = string
            print("Object initailised")
        }
    }
}


do {
    var obj = try ShowError(string: "")
}catch{
    print(error.localizedDescription)
}

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
    print("Error!! caught" )
}


//Q4:-Write a program which loads the data from a datasource of 10 employees looks like below, Program would help to give salary bonus to employees. Which is based on some conditions but if employee is not able to satisfy the condition program should throw the error with specific error condition and its description should be printed.
//Sol:

enum Competency{
    case android, iOS, AI, bigData, MEAN, drupal, AWS
}
struct Emp{
    let empID : Int
    let empName : String
    let empEmail : String
    let joiningDate : String
    let isPresent :Bool
    let competency : Competency
    let attendancePercent : Double
    
    
}

let obj1 = Emp(empID: 101, empName : "talha", empEmail: "mdtalha@ttn", joiningDate: "6-sept-2021", isPresent: true, competency: .iOS, attendancePercent:100.0)
let obj2 = Emp(empID: 102, empName : "tanya", empEmail: "tanya@ttn", joiningDate: "8-aug-2018", isPresent: false, competency: .android, attendancePercent:100.0)
let obj3 = Emp(empID: 103, empName : "saif", empEmail: "saif@ttn", joiningDate: "1-sept-2020", isPresent: false, competency: .drupal, attendancePercent:100.0)
let obj4 = Emp(empID: 104, empName : "satyam", empEmail: "satyam@ttn", joiningDate: "30-june-2012", isPresent: true, competency: .AI, attendancePercent:100.0)
let obj5 = Emp(empID: 105, empName : "Rafi", empEmail: "rafi@ttn", joiningDate: "28-feb-2019", isPresent: true, competency: .AWS, attendancePercent:100.0)
let obj6 = Emp(empID: 106, empName : "ashish", empEmail: "ashish@ttn", joiningDate: "6-sept-2021", isPresent: false, competency: .MEAN, attendancePercent:100.0)
let obj7 = Emp(empID: 107, empName : "neha", empEmail: "ankit@ttn", joiningDate: "6-sept-2021", isPresent: true, competency: .bigData, attendancePercent:100.0)
let obj8 = Emp(empID: 108, empName : "ashwin", empEmail: "ashwin@ttn", joiningDate: "18-nov-2015", isPresent: true, competency: .android, attendancePercent:100.0)
let obj9 = Emp(empID: 109, empName : "rita", empEmail: "rita@ttn", joiningDate: "6-jan-2020", isPresent: false, competency: .AWS, attendancePercent:100.0)
let obj10 = Emp(empID: 110, empName : "rohit", empEmail: "rohit@ttn", joiningDate: "8-mar-2021", isPresent: true,competency: .iOS, attendancePercent:100.0)


var empArr = [obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8,obj9,obj10]


enum Eligibility : Error{
    case absent(name : String)
    case wrongCompetency(name : String)
    case lateJoin(name : String , date : String)
    
}


class BonusProgram{
    var empList : [Emp]
    
    init(array : [Emp]) {
        empList = array
    }
    
    func allowed(email : String)throws {
        for emp in empList{
            if emp.empEmail == email{
                let comp = emp.joiningDate.components(separatedBy: "-")
                if 2021 - Int(comp[2])! >= 1 {
                    if(emp.isPresent){
                        switch emp.competency {
                            case .iOS:
                                print("\(emp.empName) is eligible for bonus")
                            case .android:
                                print("\(emp.empName) is eligible for bonus")
                            case .AI:
                                print("\(emp.empName) is eligible for bonus")
                            case .bigData:
                                ("\(emp.empName) is eligible for bonus")
                            default:
                                throw Eligibility.wrongCompetency(name : emp.empName)
                        }
                        
                    }else{
                        throw Eligibility.absent(name : emp.empName)
                    }
                    
                }else{
                    throw Eligibility.lateJoin(name : emp.empName , date : emp.joiningDate)
                }
            }
        }
        print("No such employee")
    }
}

var obj = BonusProgram(array: empArr)

do{
    try obj.allowed(email: "mdtalha@ttn")
}catch Eligibility.absent(let name){
    print("\(name) is absent today")
}catch Eligibility.lateJoin(let name, let date){
    print("\(name) has joined us on \(date) and still to complete a year with us")
}catch Eligibility.wrongCompetency(let name){
    print("\(name) competency does not fall under bonus program")
}
