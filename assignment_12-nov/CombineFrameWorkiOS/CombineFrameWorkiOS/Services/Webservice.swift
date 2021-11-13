//
//  Webservice.swift
//  CombineFrameWorkiOS
//
//  Created by Mohammad Talha on 12/11/21.
//

import Foundation
import Combine

class Webservice {
    
    func getPost()-> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid Url")
        }
        return URLSession.shared.dataTaskPublisher(for: url).map{ $0.data}
        .decode(type: [Post].self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
