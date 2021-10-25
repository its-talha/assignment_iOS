//
//  NetworkFile.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 23/10/21.
//

import Foundation

struct Images : Decodable{
    let author : String
    let id : Int
    let author_url : String
}

class NetworkFile {
    
    var imageList = [Images]()
    
    func callingApi(){
        
        let url = URL(string: "https://picsum.photos/list")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil{
                
                do{
                self.imageList = try JSONDecoder().decode([Images].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                
//                DispatchQueue.main.async {
//                    ViewController.reloadData()
//                }
            }
        }.resume()
    }
}
