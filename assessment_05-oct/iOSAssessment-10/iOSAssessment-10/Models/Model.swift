//
//  Model.swift
//  iOSAssessment-10
//
//  Created by Mohammad Talha on 11/10/21.
//

import Foundation

struct UsersListItemsModel {
    var name: String?
    var address: String?
    var age: String?
    var otherDetails: String?
    
    init(name: String?, address: String?, age: String?, otherDetails: String?) {
        self.name = name
        self.address = address
        self.age = age
        self.otherDetails = otherDetails
    }
}
