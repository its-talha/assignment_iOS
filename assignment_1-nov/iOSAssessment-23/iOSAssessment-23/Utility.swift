//
//  Utility.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 08/11/21.
//

import Foundation
import UIKit

class Utility {
    static func setRoot(){
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        
        if UserDefaults.standard.bool(forKey: "isLogin") {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let userInfoScene = storyboard.instantiateViewController(withIdentifier: "FoodTabViewController") as? FoodTabViewController
            let navigation = UINavigationController(rootViewController: userInfoScene!)
            sceneDelegate.window?.rootViewController = navigation
            sceneDelegate.window?.makeKeyAndVisible()
        } else {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let loginUserScene = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            sceneDelegate.window?.rootViewController = loginUserScene
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}


extension String {

    var isFieldEmpty: Bool {
       // return self.isEmpty
        self.isEmpty
    }
    
    var isValidPassword: Bool {
        self.count > 8
    }
    
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

extension UITextField: Validator {
    var isFieldEmpty: Bool {
        self.text?.isEmpty ?? true
    }

}
