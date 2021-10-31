//
//  ViewController.swift
//  ProtocolDelegateDemo
//
//  Created by Mohammad Talha on 30/10/21.
//

import UIKit

class ProfilePageVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var pNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setDataOnPage(_ sender: UIButton) {
        let vc1 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DataPageVC") as? DataPageVC

        vc1?.delegate = self
        navigationController?.pushViewController(vc1!, animated: true)
    }
    
    
    @IBAction func nextController(_ sender: UIButton) {
        let vc2 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DisplayPageVC") as! DisplayPageVC
        navigationController?.pushViewController(vc2, animated: true)
    }
    
}

extension ProfilePageVC: DataPageDelegate{
    func saveData(profile: Profile) {
        nameLbl.text = profile.name
        ageLbl.text = profile.age
        pNameLbl.text = profile.pName
    }
}
