//
//  SecondPage_VC.swift
//  NavigationController_Demo
//
//  Created by Mohammad Talha on 05/10/21.
//

import UIKit

class SecondPage_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func PresentNextpage(_ sender: Any) {
                let vc = myStoryboard.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdPage_VC
                
                self.navigationController?.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func PushFourthpage(_ sender: Any) {
        let vc = myStoryboard.instantiateViewController(withIdentifier: "FourthVC") as? FourthPage_VC
        
        self.navigationController?.pushViewController(vc!, animated: true)
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
