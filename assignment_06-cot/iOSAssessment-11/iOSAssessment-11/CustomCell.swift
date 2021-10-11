//
//  CustomCell.swift
//  iOSAssessment-11
//
//  Created by Mohammad Talha  on 11/10/21.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var mylabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
