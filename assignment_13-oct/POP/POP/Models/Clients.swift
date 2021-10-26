//
//  Clients.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import Foundation

struct Clients {

    var email: String
    var name: String
    var phoneNumber: String
    var image: String
    var address: String
    var id: Int
    
    init(email: String, name: String, phoneNumber: String, image: String, address: String, id: Int) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.image = image
        self.address = address
        self.id = id
    }
}
