//
//  ViewController.swift
//  iOSAssessment-10
//
//  Created by Mohammad Talha on 07/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: ViewControllerLifeCycle Methods --
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupNavBar()
        
    }
    
    @IBAction func pushTableViewButton(_ sender: UIButton) {
        let myStoryborad = UIStoryboard.init(name: "Main", bundle: nil)

        let vc = myStoryborad.instantiateViewController(withIdentifier: "UsersListVC") as? UsersListVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

