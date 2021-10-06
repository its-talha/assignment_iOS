//
//  FirstPage_VC.swift
//  NavigationController_Demo
//
//  Created by Mohammad Talha on 05/10/21.
//

import UIKit

let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
var data = ""

class FirstPage_VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var InputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputText.delegate = self
    }
    
    
    @IBAction func PushToNextPage(_ sender: Any) {
                let vc = myStoryboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondPage_VC
                
                self.navigationController?.pushViewController(vc!, animated: true)
        
            takingText(InputText)
    }
    
    func takingText(_ textField: UITextField) {
            data = InputText.text ?? "some value"
    }
}
