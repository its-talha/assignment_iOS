//
//  SegmentControlVC.swift
//  iosAssessment-7
//
//  Created by Mohammad Talha on 04/10/21.
//

import UIKit

class SegmentControlVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "Employer"
        case 1:
            textLabel.text = "Employee"
        default:
            break
        }
    }
    
}
