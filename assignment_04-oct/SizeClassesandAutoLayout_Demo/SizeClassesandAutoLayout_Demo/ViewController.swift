//
//  ViewController.swift
//  SizeClassesandAutoLayout_Demo
//
//  Created by Mohammad Talha on 07/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToNextScreen(_ sender: UIButton) {
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = myStoryboard.instantiateViewController(withIdentifier: "VC_2") as? ViewController2

        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

