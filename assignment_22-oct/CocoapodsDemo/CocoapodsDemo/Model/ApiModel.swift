//
//  ApiModel.swift
//  CocoapodsDemo
//
//  Created by Mohammad Talha on 07/11/21.
//

import Foundation

//Model to Store Data
struct Item {
    let authorName: String?
    let authorImage: String?
    
    init(authorName: String, authorImage: String) {
        self.authorName = authorName
        self.authorImage = authorImage
    }
}
