//
//  DisplayPageVC.swift
//  ProtocolDelegateDemo
//
//  Created by Mohammad Talha on 31/10/21.
//

import UIKit

class DisplayPageVC: UIViewController, DataPageDelegate{
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var pNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = DataPageVC()
        vc.delegate = self
    }
    
    func saveData(profile: Profile) {
        nameLbl.text = profile.name
        ageLbl.text = profile.age
        pNameLbl.text = profile.pName
    }

}
