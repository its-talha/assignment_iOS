//
//  ViewController.swift
//  ProtocolDelegateDemo
//
//  Created by Mohammad Talha on 30/10/21.
//

import UIKit

class ProfilePageVC: UIViewController {
    
    //outlets for label
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var pNameLbl: UILabel!
    @IBOutlet weak var headLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //notification observers for facebook
        NotificationCenter.default.addObserver(self, selector: #selector(fillDataF(notification:)), name: .facebook, object: nil)
        //notification observers for twitter
        NotificationCenter.default.addObserver(self, selector: #selector(fillDataT(notification:)), name: .twitter, object: nil)
    }
    //selector function for facebook
    @objc func fillDataF(notification: Notification){
        headLbl.text = "Facebook Info"
    }
    //selector function for twitter
    @objc func fillDataT(notification: Notification){
        headLbl.text = "Twitter Info"
    }

    //function for getting the data on page
    @IBAction func setDataOnPage(_ sender: UIButton) {
        let vc1 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DataPageVC") as? DataPageVC

        vc1?.delegate = self
        navigationController?.pushViewController(vc1!, animated: true)
    }
    
}

//extension for conforming the protocol
extension ProfilePageVC: DataPageDelegate{
    func saveData(profile: Profile) {
        nameLbl.text = profile.name
        ageLbl.text = profile.age
        pNameLbl.text = profile.pName
    }
}

//extension for setting types of notification
extension Notification.Name{
    static let facebook = Notification.Name("Facebook")
    static let twitter = Notification.Name("Twitter")
}
