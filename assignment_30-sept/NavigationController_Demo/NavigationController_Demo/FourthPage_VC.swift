//
//  FourthPage_VC.swift
//  NavigationController_Demo
//
//  Created by Mohammad Talha on 06/10/21.
//

import UIKit

class FourthPage_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.tintColor = UIColor.black
        nav?.backItem?.title = "Fourth screen"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PushFifthpage(_ sender: Any) {
        let vc = myStoryboard.instantiateViewController(withIdentifier: "FifthVC") as? FifthPage_VC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    @IBAction func popThisVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
