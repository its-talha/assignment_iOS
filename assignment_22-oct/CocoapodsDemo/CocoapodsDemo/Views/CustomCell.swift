//
//  CustomCell.swift
//  CocoapodsDemo
//
//  Created by Mohammad Talha on 07/11/21.
//

import UIKit
import SDWebImage

class CustomCell: UITableViewCell {

    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item:Item) {
           self.authorImage.sd_setImage(with: URL(string: item.authorImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
           self.authorName.text = item.authorName
       }

}
