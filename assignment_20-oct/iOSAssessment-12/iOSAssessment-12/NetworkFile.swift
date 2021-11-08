//
//  NetworkFile.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 23/10/21.
//

import Foundation
import UIKit

protocol CallingApiDelegate {
    func successfulResponse(arr : [Images])
    func failedwithError(error : String)
}

class NetworkFile {
    
    var list = [Images]()
    var delegate : CallingApiDelegate?
    
    func callingApi(){
        
        let url = URL(string: "https://picsum.photos/list")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil{
                
                do{
                self.list = try JSONDecoder().decode([Images].self, from: data!)
                    self.delegate?.successfulResponse(arr: self.list)
                }catch{
                    print("Parse Error")
                    self.delegate?.failedwithError(error: "Parse Error")
                }
            }
        }.resume()
    }
}
