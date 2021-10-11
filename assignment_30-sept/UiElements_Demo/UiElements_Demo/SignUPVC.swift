//
//  ViewController.swift
//  iosAssessment-7
//
//  Created by Mohammad Talha on 03/10/21.
//

import UIKit

class SignUPVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    //outlets for textfields
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var phoneNoTf: UITextField!
    @IBOutlet weak var PobTf: UITextField!
    @IBOutlet weak var DobTf: UITextField!
    
    //outlets for actionable Ui elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupNavBar()
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
        self.imageView.clipsToBounds = true;
        phoneNoTf.delegate = self
        self.DobTf.setInputViewDatePicker(target: self, selector: #selector(tapDone))

    }
    
    
       @objc func tapDone() {
           if let datePicker = self.DobTf.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateStyle = .medium
               self.DobTf.text = dateformatter.string(from: datePicker.date)
           }
           self.DobTf.resignFirstResponder()
       }
}


//extension for upload photo task
extension SignUPVC {
    
    @IBAction func photoUploadBtn(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageView.image = image
    }
 
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        if usernameTf.text != "" && phoneNoTf.text != "" && emailTf.text != "" && DobTf.text != ""
            
        {
            
            let myStoryborad = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = myStoryborad.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
    }
    
}



extension SignUPVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case usernameTf:
            emailTf.becomeFirstResponder()
        case emailTf:
            phoneNoTf.becomeFirstResponder()
        case phoneNoTf:
            PobTf.becomeFirstResponder()
        default:
            DobTf.resignFirstResponder()
            
        }
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile number validation
        if textField == phoneNoTf {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        if textField == PobTf {
            let allowedCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        return true
    }
    
}


//extension for using datepicker in textfield
extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .date //2
        // iOS 14 and above
        if #available(iOS 14, *) {// Added condition for iOS 14
          datePicker.preferredDatePickerStyle = .wheels
          datePicker.sizeToFit()
        }
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
