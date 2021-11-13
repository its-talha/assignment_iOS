//
//  LoginViewController.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 08/11/21.
//

import UIKit

/** To verify Useris Loggein or not and to save and remove login info Protocol */
protocol Loggable {
    var isUserLoggedIn: Bool { get }
    func saveUserInfo() -> Bool
    func removeUserInfo()
}


/** To ShowToast Protocol */
protocol ShowToastProtocol where Self: UIViewController {
    func showToastMsg(title: String, message: String)
}

extension ShowToastProtocol {
    func showToastMsg(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
}


class LoginViewController: UIViewController, ShowToastProtocol {
    
    //MARK: - IBOutlets
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
        
        if (userPhoneTextField.isFieldEmpty && passwordTextField.isValidPassword ) {
            return false
        } else {
            let userPhone = self.userPhoneTextField.text
            UserDefaults.standard.setValue(userPhone, forKey: "userphone")
            return true
        }
    }
    
    func removeUserInfo() {
        UserDefaults.standard.removeObject(forKey: "userphone")
        UserDefaults.standard.synchronize()
    }
    
}
