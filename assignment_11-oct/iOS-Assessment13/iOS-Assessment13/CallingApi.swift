//
//  CallingApi.swift
//  iOS-Assessment13
//
//  Created by Mohammad Talha on 25/10/21.
//

import Foundation

struct User{
    
    func registerUser(){
        var urlReq = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        urlReq.httpMethod = "post"
        
        let dict = ["userId" : "1", "id" : "56", "title" : "something is going", "body" : "everything is going"]
        do {
            let reqBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            urlReq.httpBody = reqBody
            urlReq.addValue("application/json", forHTTPHeaderField: "content-type")
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlReq){ (data,httpUrlReponse,error) in
            if(data != nil && data?.count != 0){
                let response = String(data: data!,encoding: .utf8)
                debugPrint(response!)
            }

        }.resume()
    }
}
