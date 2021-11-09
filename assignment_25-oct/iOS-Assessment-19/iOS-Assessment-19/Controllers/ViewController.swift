//
//  ViewController.swift
//  iOS-Assessment-19
//
//  Created by Mohammad Talha on 25/10/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.nameLbl.text = Data.shared.dataArray[indexPath.row].name
        cell.sportLbl.text = Data.shared.dataArray[indexPath.row].sport
        cell.emailLbl.text = Data.shared.dataArray[indexPath.row].email

        return cell
    }
    
}

