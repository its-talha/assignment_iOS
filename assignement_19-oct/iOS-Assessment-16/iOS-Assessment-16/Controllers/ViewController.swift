//
//  ViewController.swift
//  iOS-Assessment-16
//
//  Created by Mohammad Talha on 25/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var usernameTf: UITextField!
    let validationObj = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func LoginBtn(_ sender: UIButton) {
        let email = usernameTf.text
        let pass = passwordTf.text
        
        let result = validationObj.validate(email: email!, pass: pass!)
        
        if result.isValid {
            showAlert(msg : result.msg)
        }
        else{
            showAlert(msg : result.msg)
        }
    }
    
    func showAlert(msg : String) {
        let alert = UIAlertController(title: "Login", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

