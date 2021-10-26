//
//  GreetViewController.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import UIKit

class GreetViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var greetView: UIView!

    //MARK: - Proprties
    var detailedClientData = [Clients]()
    var detailedEmployeeData = [Employee]()
    
    
    //MARK: - ViewController LifeCylce
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        SetUp()
    }

    
    //MARK: - Custom Methods
    func SetUp() {
        
        setBorder(on: img, for: 3.0 ,with: .blue)
        round(on: img)
        
        if(detailedClientData.count > detailedEmployeeData.count) {
            for item in detailedClientData {
                self.id.text = "EmployeeID : " + String(item.id)
                self.name.text = "Name : " + item.name
                self.email.text = "Email : " + item.email
                self.Address.text = "Address : " + item.address
                self.phoneNo.text = "PhoneNo. : " + item.phoneNumber
                self.img.image = UIImage(named: "\(item.image)")
            }
        } else if (detailedClientData.count > detailedEmployeeData.count){
            for item in detailedEmployeeData {
                self.id.text = "EmployeeID : " + String(item.id)
                self.name.text = "Name : " + item.fName + item.lName
                self.email.text = "Email : " + item.email
                self.Address.text = "Address : " + item.address
                self.phoneNo.text = "PhoneNo. : " + item.phoneNumber
                self.img.image = UIImage(named: "\(item.imageUser)")
            }
        } else {
            self.name.text = "Name : " + (UserDefaults.standard.value(forKey: "username") as? String ?? "")
            self.email.text = "Email : " + (UserDefaults.standard.value(forKey: "useremail") as? String ?? "")
            //self.Address.text = "Address : + (UserDefaults.standard.value(forKey: "username"))
            self.phoneNo.text = "PhoneNo. : " + (UserDefaults.standard.value(forKey: "userphone") as? String ?? "")
            self.img.image = UIImage(named: "img1")
        }
    

    }
    
    
    //MARK: - IBActions
    @IBAction func greetUserButton(_ sender: UIBarButtonItem) {
        showToastMsg(title: "Greetings", message: "Welcome Mr. \(name.text ?? "Guest")")
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "useremail")
        UserDefaults.standard.removeObject(forKey: "userphone")
        UserDefaults.standard.synchronize()
        
        showToastMsg(title: "Hey", message: "LoggedOutSuccessFully")
        UserDefaults.standard.set(false, forKey: "isLogin")
        Utility.setRoot()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}


//MARK: - Protocol Confirming
extension GreetViewController : Roundable, Bordable, ShowToastProtocol {
 
}

