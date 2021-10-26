//
//  Employee.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import Foundation


struct Employee {

    var email: String
    var phoneNumber: String
    var employeeId: Int
    var fName: String
    var lName: String
    var imageUser: String
    var userRole: String
    var joiningDate: String
    var id: Int
    var address: String

    init(email: String,phoneNumber: String, employeeId: Int, fName: String, lName: String, imageUser: String, userRole: String, joiningDate: String, id: Int, address: String) {
        self.email = email
        self.phoneNumber = phoneNumber
        self.employeeId = employeeId
        self.fName = fName
        self.lName = lName
        self.imageUser = imageUser
        self.userRole = userRole
        self.joiningDate = joiningDate
        self.id = id
        self.address = address
    }
}
