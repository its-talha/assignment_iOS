//
//  ApiClient.swift
//  CocoapodsDemo
//
//  Created by Mohammad Talha on 07/11/21.
//

import Foundation
import UIKit
import Alamofire

class APIClient {
    
    static let shared: APIClient = APIClient()
    
    func getData(completion: @escaping (_ success: [[String: Any]]?, _ error: Error?, _ isSuccess:Bool) -> Void ) {
        
        AF.request("https://picsum.photos/v2/list").responseJSON { response in
            print(response)
            
            switch response.result {
            case .success(let value):
                if let Json = value as? [[String: Any]] {
                    if (Json != nil) {
                        completion(Json, nil, true)
                    } else {
                        completion(Json, nil, false)
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }
}

