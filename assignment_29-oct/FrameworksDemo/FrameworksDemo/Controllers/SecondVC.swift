//
//  SecondVC.swift
//  FrameworksDemo
//
//  Created by Mohammad Talha on 08/11/21.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    @IBAction func changeMode(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
            {
            case 0:
                // light mode
                overrideUserInterfaceStyle = .light
                self.view.overrideUserInterfaceStyle = .light
                label.overrideUserInterfaceStyle = .light
                label.text = "Light Mode"

            case 1:
                //Dark mode
                overrideUserInterfaceStyle = .dark
                self.view.overrideUserInterfaceStyle = .dark
                label.overrideUserInterfaceStyle = .dark
                label.text = "Dark Mode"

            default:
                break
            }
    }
}
