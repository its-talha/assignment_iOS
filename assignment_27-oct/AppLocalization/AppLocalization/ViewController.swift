//
//  ViewController.swift
//  AppLocalization
//
//  Created by Mohammad Talha on 28/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var lotterywonLbl: UILabel!
    @IBOutlet weak var demoSeg: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changingLanguage(lan: "en")
        // Do any additional setup after loading the view.
    }

    @IBAction func segAction(_ sender: UISegmentedControl) {
        
        let id = demoSeg.selectedSegmentIndex
        switch id {
        case 0:
            self.changingLanguage(lan: "en")
        case 1:
            self.changingLanguage(lan: "de")
        case 2:
            self.changingLanguage(lan: "es")
        default:
            self.changingLanguage(lan: "en")
        }
    }
    
    func changingLanguage(lan : String)
    {
        titleLbl.text = "title".stringLoc(loc: lan)
        nameLbl.text = "namekey".stringLoc(loc: lan)
        stateLbl.text = "statekey".stringLoc(loc: lan)
        countryLbl.text = "countrykey".stringLoc(loc: lan)
        dobLbl.text = "dobkey".stringLoc(loc: lan)
        lotterywonLbl.text = "lotterykey".stringLoc(loc: lan)        
    }
    
}

extension String{
    
    func stringLoc(loc : String) -> String
    {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle! , value: "", comment: "")
        
    }
}

