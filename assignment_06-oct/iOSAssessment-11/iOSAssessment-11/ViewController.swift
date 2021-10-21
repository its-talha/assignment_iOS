//
//  ViewController.swift
//  iOSAssessment-11
//
//  Created by Mohammad Talha on 08/10/21.
//

import UIKit

let myStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerOneButton(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "StackViewDemoVC") as? StackViewDemo
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func answerTwoButton(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "CalculatorDemoVC") as? CalculatorDemoVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func answerThreeButton(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "AutolayoutProgramaticVc") as? AutolayoutProgramaticVc
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func answerFourButton(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "ScrollViewDemoVC") as? ScrollViewDemoVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

