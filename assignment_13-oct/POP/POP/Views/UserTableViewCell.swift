//
//  UserTableViewCell.swift
//  POP
//
//  Created by Mohammad Talha on 26/10/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var employeeId: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userView: UIView!

  
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
       round(on: userImage)
    }
    
    func configureUI(){
        setBorder(on: userView)
    }
    
}


extension UserTableViewCell: Roundable, Bordable {

}
