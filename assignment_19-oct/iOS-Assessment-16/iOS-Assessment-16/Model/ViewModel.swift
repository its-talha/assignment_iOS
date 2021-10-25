//
//  ViewModel.swift
//  iOS-Assessment-16
//
//  Created by Mohammad Talha on 25/10/21.
//

import Foundation

struct ViewModel {
    
    func validate(email : String, pass : String) -> (msg : String, isValid : Bool){
        
        guard !email.isEmpty && !pass.isEmpty else {
            return ("Email or Password cannot be empty", false)
        }
        
        guard isValidEmail(email) else {
            return ("Email is invalid",false)
        }
        
        guard pass.count > 6 else {
            return ("Password should be greater than 6 characters",false)
        }
        
        return ("Success",true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
