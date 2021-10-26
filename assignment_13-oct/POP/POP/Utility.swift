//
//  Utility.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import Foundation
import UIKit

class Utility {
    static func setRoot(){
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        
        if UserDefaults.standard.bool(forKey: "isLogin") {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let userInfoScene = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController") as? UserInfoViewController
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
