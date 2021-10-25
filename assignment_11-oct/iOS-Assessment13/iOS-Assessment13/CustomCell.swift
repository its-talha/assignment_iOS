//
//  CustomCell.swift
//  iOS-Assessment13
//
//  Created by Mohammad Talha on 21/10/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
