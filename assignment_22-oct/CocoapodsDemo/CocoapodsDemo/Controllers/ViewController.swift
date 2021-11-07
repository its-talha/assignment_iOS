//
//  ViewController.swift
//  CocoapodsDemo
//
//  Created by Mohammad Talha on 06/11/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    var arrayOfItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
                
        // storing data in model
        APIClient.shared.getData { response, error, isSuccess in
        
            if let picsumData = response {
                for items in picsumData {
                    let itemUpdates = Item(authorName:  items["author"] as? String ?? "", authorImage: items["download_url"] as? String ?? "")
                            self.arrayOfItems.append(itemUpdates)
                        }
                        
                DispatchQueue.main.async {
                    self.tabelView.reloadData()

                }
            }
        }
                
    }
    func setupTableView() {
           tabelView.delegate = self
           tabelView.dataSource = self
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell {
                   let data = arrayOfItems[indexPath.row]
                   cell.configureCell(item: data)
                   return cell
        }
        return UITableViewCell()
    }
    
    
}

