//
//  ViewController.swift
//  iOS-Assessment13
//
//  Created by Mohammad Talha on 21/10/21.
//

import UIKit

struct Posts : Decodable{
    let id : Int
    let title : String
    let body : String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataList = [Posts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let obj = User()
        obj.registerUser()
        getData()
    }
    func getData(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                if error == nil{
                    self.dataList = try JSONDecoder().decode([Posts].self, from: data!)
                    
                    for value in self.dataList{
                        print(value.id,":",value.title)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }catch{
                print("Error in parsing")
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.titleLbl.text = String(dataList[indexPath.row].id)
        cell.bodyLbl.text = dataList[indexPath.row].body
        
        return cell
    }
}

