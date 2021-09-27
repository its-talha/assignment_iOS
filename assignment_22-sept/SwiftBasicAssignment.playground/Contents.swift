//Q1 : create a third employee structure that contains the information from both based on common id.
//Sol:

enum Country : String{
    case america = "America",india = "India",britain = "Britain",japan = "Japan",china = "China"
}
enum Department {
    case iOS, android, jvm, full_stack, web
}

struct Personal{
    let empId : Int
    let name : String
    let country : Country
    let address : String
    let hobbies : String?
}

//structure for professional info
struct Professional{
    let empId : Int
    let name : String
    let dept : Department
    let bran : Country
    let experience : Double
}

//structure containing both info based on empId
struct Info{
    let empId : Int
    let name : String
    let country : Country
    let dept : Department
    let bran : Country
    let experience : Double
    let address : String
    let hobbies : String?
}


let person1 = Personal(empId: 101, name : "Jack", country: .america, address: "245/98 backstreet", hobbies: "basketball")
let person2 = Personal(empId: 102, name : "Talha", country: .india, address: "2/98 Lucknow", hobbies: "guitar")
let person3 = Personal(empId: 103, name : "Michele", country: .britain, address: "785/98 Uk", hobbies: "tennis")
let person4 = Personal(empId: 104, name : "Fujitsu", country: .japan, address: "26/1578 downtown", hobbies: "eating sushi")
let person5 = Personal(empId: 105, name : "xiahu", country: .china, address: "245/98 belbottom", hobbies: "karate")


var arrPer : [Personal] = [person1, person2, person3, person4, person5]


let pro1 = Professional(empId: 101, name: "Jack", dept: .android, bran: .america, experience: 3.5)
let pro2 = Professional(empId: 108, name: "Safdija", dept: .full_stack, bran: .japan, experience: 8)
let pro3 = Professional(empId: 106, name: "Yrusko", dept: .android, bran: .britain, experience: 4)
let pro4 = Professional(empId: 103, name: "Michele", dept: .jvm, bran: .china, experience: 7.3)
let pro5 = Professional(empId: 104, name: "Fujitsu", dept: .web, bran: .japan, experience: 3)
let pro6 = Professional(empId: 102, name: "Talha", dept: .iOS, bran: .india, experience: 2)
let pro7 = Professional(empId: 109, name: "nurmog", dept: .full_stack, bran: .china, experience: 1)
let pro8 = Professional(empId: 114, name: "Findel", dept: .iOS, bran: .china, experience: 4.3)
let pro9 = Professional(empId: 167, name: "Sam", dept: .android, bran: .britain, experience: 6.7)
let pro10 = Professional(empId: 189, name: "Saphory", dept: .jvm, bran: .america, experience: 9)
let pro11 = Professional(empId: 199, name: "Phil", dept: .jvm, bran: .japan, experience: 11)
let pro12 = Professional(empId: 119, name: "Gahti", dept: .web, bran: .india, experience: 0)
 
var arrPro: [Professional] = [pro1, pro2, pro3, pro4, pro5, pro6, pro7, pro8, pro9, pro10, pro11, pro12]
var arrInfo = [Info]()
var count = 0

for id in arrPer {
    count += 1
    if let i = arrPro.firstIndex(where: { $0.empId == id.empId }) {
        arrInfo.append(Info(empId: id.empId, name: id.name, country: id.country, dept: arrPro[i].dept, bran: arrPro[i].bran, experience: arrPro[i].experience, address: id.address, hobbies: id.hobbies))
    }
}

for info in arrInfo{
    print(info)
}





//Q2 : write a function that takes the two structure and give me list of all the employee that live in certain country
//Sol:

let person6 = Personal(empId: 106, name : "yruwo", country: .britain, address: "245/98 backstreet", hobbies: nil)
let person7 = Personal(empId: 107, name : "Jack", country: .japan, address: "245/98 backstreet", hobbies: nil)
let person8 = Personal(empId: 108, name : "Afdija", country: .japan, address: "245/98 backstreet", hobbies: nil)
let person9 = Personal(empId: 109, name : "Numog", country: .china, address: "245/98 backstreet", hobbies: "cricket")
let person10 = Personal(empId: 110, name : "Phil", country: .india, address: "245/98 backstreet", hobbies: "football")
let person11 = Personal(empId: 111, name : "Rampage", country: .america, address: "245/98 backstreet", hobbies: "chess")
let person12 = Personal(empId: 112, name : "Jack", country: .india, address: "245/98 backstreet", hobbies: nil)

arrPer.append(contentsOf: [person6,person7,person8,person9,person10,person11,person12])

func employeeList(arr : [Personal],country : Country) -> [String]{
    var list0 = [String]()
    for i in arr{
        if case country = i.country{
            list0.append(i.name)
        }
    }
    return list0
}

var empList = employeeList(arr: arrPer, country: .america)

for j in empList{
    print(j)
}





//Q3 :   write a function that give me list of all the employee that live in certain department
//Sol:
func departmentList(array : [Professional],dept : Department) -> [String]{
    var list1 = [String]()
    for name in array{
        if(name.dept == dept){
            list1.append(name.name)
        }
    }
    return list1
}

var deptList = departmentList(array: arrPro, dept: .android)
for i in deptList{
    print(i)
}





//Q4 : write a function that give me list of all the employee that live in same country and work in the same branch.
//Sol:

func CommonBandC(array : [Info]) -> [String]{
    var list2 = [String]()
    for i in array{
        if case i.country = i.bran {
            list2.append(i.name)
        }
    }
    return list2
}

var samePlaceAndBranch = CommonBandC(array: arrInfo)

for j in samePlaceAndBranch{
    print(j)
}





//Q5 :  write a function that return me list of all the employee name that has a hobby and with their experience
//Sol:


func hobbyAndExperience(arr : [Info]){
    for i in arr{
        if i.hobbies != nil && i.hobbies != ""{
            print("Name is \(i.name) and Experience is \(i.experience)")
        }
    }
}

hobbyAndExperience(arr: arrInfo)





//Q6 : write a function that return me list of all the employee name that starts with any “S”
//Sol:

func matchString(arr : [Professional]) -> [String]{
    var list3 = [String]()
    for i in arr{
        if i.name.first == "S" || i.name.first == "s"{
            list3.append(i.name)
        }
    }
    return list3
}

var empName = matchString(arr : arrPro)

for j in empName{
    print(j)
}

