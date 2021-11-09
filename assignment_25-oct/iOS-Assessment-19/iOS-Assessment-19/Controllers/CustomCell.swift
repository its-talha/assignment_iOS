//
//  CustomCell.swift
//  iOS-Assessment-19
//
//  Created by Mohammad Talha on 26/10/21.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var sportLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
