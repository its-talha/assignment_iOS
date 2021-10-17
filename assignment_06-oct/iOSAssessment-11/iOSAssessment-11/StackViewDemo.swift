//
//  StackViewDemoVC.swift
//  iOSAssessment-11
//
//  Created by Mohammad Talha on 08/10/21.
//

import UIKit

class StackViewDemo: UIViewController {
    var current : UIView?
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view3: UIStackView!
    @IBOutlet weak var view2: UIStackView!
    @IBOutlet weak var view4: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Enter number from 1 to 4 only", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }

    @IBAction func showView(_ sender: UIButton) {
        
        let count = input.text
        if current != nil{
            current?.isHidden = true
        }
      
        switch(count){
        case "1":
            view1.isHidden = false
            current = view1
        case "2":
            view2.isHidden = false
            current = view2
        case "3":
            view3.isHidden = false
            current = view3
        case "4":
            view4.isHidden = false
            current = view4
        default:
            showAlert()
        }
        
    }
}
