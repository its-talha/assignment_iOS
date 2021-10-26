//
//  CustomProtocols.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//
import Foundation
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


/** To round imageViewProtocol */
protocol Roundable {
    func round(on image: UIImageView)
}

extension Roundable {
    func round(on image: UIImageView){
        image.layer.cornerRadius = image.layer.frame.width / 2
        image.clipsToBounds = true
    }
}


/** To Give Border on a view Protocol */
protocol Bordable {
    func setBorder(on view: UIView, for width: CGFloat, with color: UIColor)
}

extension Bordable {
    func setBorder(on view: UIView, for width: CGFloat = 5.0, with color: UIColor = .black) {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
}


/** Loadable Protocol */
protocol Loadable: AnyObject {
    func loadIndicator(onView view: UIView)
}


/** error Protocol */
protocol ErrorViewProtocol: AnyObject {
    func showError(onView view: UIView)
}


/** Validaion Protocol */
protocol Validator where Self: UITextField  {
   // var isValidEmail: Bool { get }
    var isValidPassword: Bool { get }
}

extension Validator {
    var isFieldEmpty: Bool {
        self.text?.isEmpty ?? true
    }
    
    var isValidPassword: Bool {
        (self.text?.count ?? 0) > 8
    }
}
