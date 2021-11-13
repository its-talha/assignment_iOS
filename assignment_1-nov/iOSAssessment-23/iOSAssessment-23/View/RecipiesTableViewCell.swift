//
//  RecipiesTableViewCell.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 10/11/21.
//

import UIKit

class RecipiesTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var ingrediantesLbl: UILabel!
    @IBOutlet weak var createdByLbl: UILabel!
    @IBOutlet weak var timeToPrepareLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
