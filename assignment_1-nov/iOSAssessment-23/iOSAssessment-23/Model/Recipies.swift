//
//  Recipies.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 10/11/21.
//

import Foundation

struct Recipies {
    var name: String
    var date: String
    var ingrediantes: String
    var createdBy: String
    var timeToPrepare: String
    
    init(name: String, date: String, ingrediantes: String, createdBy: String, timeToPrepare: String){
        self.name = name
        self.date = date
        self.ingrediantes = ingrediantes
        self.createdBy = createdBy
        self.timeToPrepare = timeToPrepare
    }
}
