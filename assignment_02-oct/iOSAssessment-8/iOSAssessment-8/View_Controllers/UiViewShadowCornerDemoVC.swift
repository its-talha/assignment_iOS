//
//  UiViewShadowCornerDemoVC.swift
//  iOSAssessment-8
//
//  Created by Mohammad Talha on 04/10/21.
//

import UIKit

class UiViewShadowCornerDemoVC: UIViewController {
    
    @IBOutlet weak var demoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    private func setUpView(){
        // corner radius
        demoView.layer.cornerRadius = demoView.frame.height / 2

        // border
        demoView.layer.borderWidth = 1.0
        demoView.layer.borderColor = UIColor.black.cgColor

        // shadow
        demoView.layer.shadowColor = UIColor.black.cgColor
        demoView.layer.shadowOffset = CGSize(width: 3, height: 3)
        demoView.layer.shadowOpacity = 0.7
        demoView.layer.shadowRadius = 4.0
        
    }

}
