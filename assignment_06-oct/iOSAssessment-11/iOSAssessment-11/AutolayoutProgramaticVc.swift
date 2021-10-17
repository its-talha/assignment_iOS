//
//  AutolayoutProgramaticVc.swift
//  iOSAssessment-11
//
//  Created by Mohammad Talha on 08/10/21.
//

import UIKit

class AutolayoutProgramaticVc: UIViewController {
    
    //IBOutlets for image
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    //IBOutlets for labels
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    //IBOutlets for stackViews
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var firstVerticalStackView: UIStackView!
    @IBOutlet weak var secondVerticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.translatesAutoresizingMaskIntoConstraints = false
        img2.translatesAutoresizingMaskIntoConstraints = false
        img3.translatesAutoresizingMaskIntoConstraints = false
        img4.translatesAutoresizingMaskIntoConstraints = false
        lbl1.translatesAutoresizingMaskIntoConstraints = false
        lbl2.translatesAutoresizingMaskIntoConstraints = false
        lbl3.translatesAutoresizingMaskIntoConstraints = false
        lbl4.translatesAutoresizingMaskIntoConstraints = false
       
        
        let img1TopContraint = img1.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10)
        let img1LeadingContraint = img1.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10)
        let img1WidthContraint = img1.widthAnchor.constraint(equalToConstant: 170)
        let img1HeightContraint = img1.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([img1TopContraint, img1LeadingContraint, img1WidthContraint, img1HeightContraint])
        
        
        
        let img2TopContraint = img2.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20)
        let img2TrailingContraint = img2.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        let img2WidthContraint = img2.widthAnchor.constraint(equalToConstant: 200)
        let img2HeightContraint = img2.heightAnchor.constraint(equalToConstant: 170)
        
        NSLayoutConstraint.activate([img2TopContraint, img2TrailingContraint, img2WidthContraint, img2HeightContraint])
        
        
        let lbl1TopContraint = lbl1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 10)
        let lbl1LeadingContraint = lbl1.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20)
        let lbl1WidthContraint = lbl1.widthAnchor.constraint(equalToConstant: 170)
        
        NSLayoutConstraint.activate([lbl1TopContraint, lbl1LeadingContraint, lbl1WidthContraint])
    }
    
}
