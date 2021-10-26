//
//  NetworkFile.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 23/10/21.
//

import Foundation

class NetworkFile {
    
    var list = [Images]()
    
    func callingApi() -> [Images]{
        
        let url = URL(string: "https://picsum.photos/list")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil{
                
                do{
                self.list = try JSONDecoder().decode([Images].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                
                DispatchQueue.main.async {
//                    ViewController.reloadData()
                }

            }
        }.resume()
        
        return list
    }
}

