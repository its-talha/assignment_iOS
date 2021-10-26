//
//  LoginViewController.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import UIKit

class LoginViewController: UIViewController, ShowToastProtocol{

    //MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - ViewController Life Cycle Mthode
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - IBActions
    @IBAction func loginButton(_ sender: UIButton) {
        let success = saveUserInfo()
        guard success else {
            // show toast fill all fields
            showToastMsg(title: "LoginFailed", message: "Fill All Fields Or Password should not greater then 8 characters")
            return
        }
        UserDefaults.standard.set(true, forKey: "isLogin")
        Utility.setRoot()
        
        
    }
    
}


//MARK: - Comfirming Protocols
extension LoginViewController: Loggable {
    
    var isUserLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: "username")
    }
    
    func saveUserInfo() -> Bool {
        
        if (usernameTextField.isFieldEmpty || userPhoneTextField.isFieldEmpty || passwordTextField.isValidPassword || userEmailTextField.isFieldEmpty ) {
            return false
        } else {
            let userName = self.usernameTextField.text
            let userEmail = self.userEmailTextField.text
            let userPhone = self.userPhoneTextField.text
            UserDefaults.standard.setValue(userName, forKey: "username")
            UserDefaults.standard.setValue(userEmail, forKey: "useremail")
            UserDefaults.standard.setValue(userPhone, forKey: "userphone")
            return true
        }
    }
    
    func removeUserInfo() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.synchronize()
    }
    
}


