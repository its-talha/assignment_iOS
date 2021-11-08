//
//  SecondVC.swift
//  FrameworksDemo
//
//  Created by Mohammad Talha on 08/11/21.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        //Dark mode
        overrideUserInterfaceStyle = .dark
        self.view.overrideUserInterfaceStyle = .dark
        label.overrideUserInterfaceStyle = .dark
        label.text = "Dark Mode"
        
        // light mode
//        overrideUserInterfaceStyle = .light
//        self.view.overrideUserInterfaceStyle = .light
//        label.overrideUserInterfaceStyle = .light
//        label.text = "Light Mode"
    }
}
