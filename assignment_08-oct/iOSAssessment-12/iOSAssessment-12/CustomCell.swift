//
//  CustomCell.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 20/10/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        contentView.layer.cornerRadius = 10
//        contentView.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
            self.contentView.layer.cornerRadius = 30.0
//            self.contentView.layer.borderColor = UIColor.red.cgColor
//            self.contentView.layer.borderWidth = 0.5
            self.clipsToBounds = true
        
//            self.layer.shadowColor = UIColor.black.cgColor
//            self.layer.shadowRadius = 7.0
//            self.layer.masksToBounds = false
//            self.layer.shadowOpacity = 0.3
//            self.layer.shadowOffset = CGSize(width: 0, height: 0)
//            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
//            
        }
}
