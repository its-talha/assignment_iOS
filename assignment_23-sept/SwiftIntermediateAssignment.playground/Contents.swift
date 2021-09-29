//Q1:-Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).
//Sol:

func siftBeans(arr : [String]) -> (beans : [String],otherGrocewries : [String]){
    var beans = [String]()
    var groceries = [String]()
    for grocery in arr{
        if grocery.contains("beans"){
            beans.append(grocery)
        }else{
            groceries.append(grocery)
        }
    }
    return (beans,groceries)
}
var groceryList = ["green beans","milk","black beans","pinto beans","apples"]
let result = siftBeans(arr : groceryList)





//Q2:-Make a calculator class with a function name “equals” that take an enum case as value like multiply, subtraction, addition, square root, division.
//Sol:

enum operation{
    case addition,subtraction,multiplication,division,squareroot
}

class Calculator{
    var a : Double
    var b : Double?
    init(firstForSquareRoot : Double , second : Double?){
        a = firstForSquareRoot
        b = second
    }
    func equals(oper : operation) -> Double{
        var calc : Double?
        if let unwrapped = b{

            switch oper {
                case .addition:
                    calc = a + unwrapped
                case .subtraction:
                    calc = a - unwrapped
                case .multiplication:
                    calc = a * unwrapped
                case .division:
                    calc = a / unwrapped
                case .squareroot:
                    calc = a.squareRoot()
            }
        }else{
            if oper == .squareroot{
                calc = a.squareRoot()
            }
        }
        return calc!
    }
}

var obj = Calculator(firstForSquareRoot: 5, second: nil)
var result = obj.equals(oper: .squareroot)
print(result)





//Q3:-Make the same calculator using functions as an argument, define all type functions in a struct.
//Sol:
struct Operations{
    func addition(a: Int, b: Int) -> Int {
        return a + b
    }

    func subtraction(a: Int, b: Int) -> Int {
        return a - b
    }

    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }

    func division(a: Int, b: Int) -> Int {
        return a / b
    }
}

func calculate(a: Int, b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a,b)
    print(result)
}
var calc = Operations()
var result: () = calculate(a: 5, b: 6, operation: calc.subtraction)
print(result)



/*Q4:- Create a TraineesActivity Class which lazily initializes a data source of all the trainees in an array.

Define a closure to filter and find the trainee object based on the name passed.
Create an enum explained below which would also have a function returning a closure that takes the trainee object and return a string describing the skill for every enum case.
This TraineeActivity would provide three functions as below to perform, record, and rerun the activity. On calling perform passing the name of trainee make use of closure declared to find the trainee object, pass this object to activity closure defined in enum to execute the activity. Later record this activity in any data structure mapped to a trainee and use this data structure to rerun the activity performed.
on deinitialization, it should print - Hey !!! Thanks, I am gone.
Note - Make use of closures, lazy, type alias, optional binding & chaining,
Outline of class and data should be as follows -

Class TraineesActivity
    trainesData - load lazily
    closure - chooseFilterObject
    functions -
        performActivity
        recordActivity
        rerunActivity

Struct Trainee
 - name
 - dance = 78
 - run = 65
 - Sing = 35
 - fight = 2
 - academic = 46

 
Enum {
    case dance
    case academic
    case run
    case sing
    case Fights
    a function returning activity closure that take trainee object and prints the activity skill
    }

Test Run -
var trainee : Tainees? = Tainees()
trainee?.performActivity(trainee: “Waseem”, activity: .run)
trainee?.performActivity(trainee: “Anindiya”, activity: .academic)
trainee?.performActivity(trainee: “Rekha”, activity: .run)
trainee?.rerunActivity()
trainee = nil

Prints log -
Waseem good run 70
Anindiya good academic 45
No trainee found
Waseem good run 70
Anindiya good academic 45

Hey !!! Thanks, I am gone.
*/
//Sol:
struct myDataSource {
    var name: String
    var dance: Int
    var run: Int
    var Sing: Int
    var fight: Int
    var academic: Int
}

enum Task{
    case dance
    case run
    case sing
    case fight
    case academic

    func task() -> String {
        switch  self {
        case .dance:
            return "good dance"
        case .run:
            return "good run"
        case .sing:
            return "good sings"
        case .fight:
            return "good fights"
        case .academic:
            return "good academics"
        }
    }

    func filter(_ name: String, object: (String) -> Void ){
        object(name)
    }

}

class  TraineesActivity{

    lazy var myData: [myDataSource] = [.init(name: "Vijender", dance: 12, run: 73, Sing: 44, fight: 90, academic: 98),
                                       .init(name: "Rahul", dance: 23, run: 34, Sing: 46, fight: 56, academic: 67),
                                       .init(name: "Alez", dance: 44, run: 55, Sing: 22, fight: 78, academic: 23) ]

    var records1: [myDataSource] = []
    var records2: [Task] = []
    func performActivity(_ name: String, _ activity: Task){
        var tranieeobj: myDataSource? = nil
        activity.filter(name) { (name) in
            for data in myData where data.name == name {
                tranieeobj = data
            }
        }
        if tranieeobj != nil {
            print("\(tranieeobj?.name ?? "not") good \(activity) \(tranieeobj!.run)")
            recordActivity(trainee: tranieeobj!, Activity: activity)
        }
        else{
            print("No trainee found")
        }
    }

    func recordActivity(trainee traineeObj: myDataSource, Activity activity: Task) {
        records1.append(traineeObj)
        records2.append(activity)
    }

    func rerunActivity() {
        for i in records1 {
            for j in records2 {
                print("\(i.name) good " + "\(j)" + " \(i.run)" )
        }
    }
    }
    deinit {
        print("Hey !!! Thanks, I am gone.")
    }

}
var obj1 = TraineesActivity()
obj1.performActivity("Vijender", .run)
obj1.performActivity("Rahul", .run)
obj1.performActivity("Al", .academic)
obj1.rerunActivity()

