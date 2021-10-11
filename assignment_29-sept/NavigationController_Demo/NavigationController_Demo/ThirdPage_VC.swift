//
//  ThirdPage_VC.swift
//  NavigationController_Demo
//
//  Created by Mohd Talha  on 04/10/21.
//

import UIKit

class ThirdPage_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    extension ThirdPage_VC {
        @IBAction func dismissVCButton(_ sender: UIButton) {
            dissmisVC()
        }
    }

    extension ThirdPage_VC {
        func dissmisVC(){
            self.dismiss(animated: true, completion: nil)
        }

    }
