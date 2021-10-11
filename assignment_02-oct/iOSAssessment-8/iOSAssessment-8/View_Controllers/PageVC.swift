//
//  PageVC.swift
//  iOSAssessment-8
//
//  Created by Mohammad Talha on 04/10/21.
//

import Foundation
import UIKit

class PageVC: UIViewController {
    
    var titleLabel: UILabel?
    
    var page: Pages
    
    init(with page: Pages) {
        self.page = page
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        titleLabel?.center = CGPoint(x: 200, y: 250)
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.text = page.name
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.view.addSubview(titleLabel!)
        
        
    }
}
