//
//  UsersListVC.swift
//  iOSAssessment-10
//
//  Created by Mohammad Talha on 07/10/21.
//

import UIKit

class UsersListVC: UIViewController {

    @IBOutlet weak var usersListTableView: UITableView!
    
    var dataIS = [UsersListItemsModel]()
    var loadMoreData = [UsersListItemsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usersListTableView.reloadData()
    }
    
    
    /// SetUpTableView
    private func setUpTableView(){
        
        usersListTableView.delegate = self
        usersListTableView.dataSource = self
        
        let nib = UINib.init(nibName: "UsersListTVC", bundle: nil)
        usersListTableView.register(nib, forCellReuseIdentifier: "UsersListTVC")
    }
    
    /// To Refresh Data on List
    private func dataRefresh(){
        dataIS = dataIS + loadMoreData.prefix(9)
        loadMoreData = Array(loadMoreData.dropFirst(9))
        
        usersListTableView.reloadData()
    }

}



//MARK: IBActions
extension UsersListVC {
    
    @IBAction func loadMoreDataBttn(_ sender: UIButton) {
        dataRefresh()
    }
    
    
    @IBAction func refreshListButton(_ sender: UIBarButtonItem) {
        dataRefresh()
    }
    
    @IBAction func goToListButton(_ sender: UIBarButtonItem) {
        let myStoryborad = UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = myStoryborad.instantiateViewController(withIdentifier: "ScrollViewDemoVC") as? ScrollViewDemoVC
        vc?.delegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


//MARK: Table View DataSource Methods
extension UsersListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataIS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersListTableView.dequeueReusableCell(withIdentifier: "UsersListTVC", for: indexPath) as? UsersListTVC
        let data = dataIS[indexPath.row]
        
        cell?.nameLabel.text = data.name
        cell?.addressLabel.text = data.address
        cell?.ageLabel.text = data.age
        cell?.otherDetailsLabel.text = data.otherDetails
        cell?.outSideView.layer.borderColor = CGColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        cell?.outSideView.layer.borderWidth = 3
        return cell!
    }

}


//MARK: UserListDelegate Storing Data
extension UsersListVC: SendUsersListDelegate {
    func sendDataToList(content: UsersListItemsModel) {
        if dataIS.count < 9 {
            dataIS.append(content)
        } else {
            loadMoreData.append(content)
        }
    }
}
