//
//  DisplayPageVC.swift
//  ProtocolDelegateDemo
//
//  Created by Mohammad Talha on 31/10/21.
//

import UIKit

class DisplayPageVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    //Button action for setting notification as facebook type
    @IBAction func fbSetBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .facebook, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    //Button action for setting notification as twitter type
    @IBAction func twSetBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .twitter, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
