//
//  HomeVc.swift
//  iosAssessment-7
//
//  Created by Mohammad Talha on 04/10/21.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var TVtextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//MARK: IBActions-->>
//MARK: ---
extension HomeVC {
    
    @IBAction func goToDetails(_ sender: UIButton) {
        if TVtextView.text != "" {
            let myStoryborad = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = myStoryborad.instantiateViewController(withIdentifier: "SegmentControlVC") as? SegmentControlVC
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
