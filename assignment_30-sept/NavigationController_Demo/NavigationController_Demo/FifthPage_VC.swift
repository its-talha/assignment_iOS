//
//  FifthPage_VC.swift
//  NavigationController_Demo
//
//  Created by Mohammad Talha on 06/10/21.
//

import UIKit

class FifthPage_VC: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLbl.text = data
    }
    

    @IBAction func popToFirstVC(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
