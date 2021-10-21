//
//  ScrollViewDemoVC.swift
//  iOSAssessment-10
//
//  Created by Mohammad Talha on 07/10/21.
//

import UIKit

protocol SendUsersListDelegate: AnyObject{
    func sendDataToList(content: UsersListItemsModel)
}

class ScrollViewDemoVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var otherDetailsTF: UITextField!
    
    weak var delegate: SendUsersListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backToHome(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToUsersList(_ sender: UIBarButtonItem) {
        
        delegate?.sendDataToList(content: UsersListItemsModel(name: nameTF.text, address: addressTF.text, age: ageTF.text, otherDetails: otherDetailsTF.text))
        
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ScrollViewDemoVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case nameTF:
            addressTF.becomeFirstResponder()
        case addressTF:
            ageTF.becomeFirstResponder()
        case ageTF:
            otherDetailsTF.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
}
