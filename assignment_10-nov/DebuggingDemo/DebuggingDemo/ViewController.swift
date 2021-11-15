//
//  ViewController.swift
//  DebuggingDemo
//
//  Created by Mohammad Talha on 15/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0

    @IBOutlet weak var numberLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addBtn(_ sender: Any) {
        count += 1
        numberLbl.text = String(count)
    }
    @IBAction func minusbtn(_ sender: Any) {
        if count > 0{
            count -= 1
            numberLbl.text = String(count)
        }
    }
}

