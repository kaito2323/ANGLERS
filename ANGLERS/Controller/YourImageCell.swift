//
//  YourImageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class YourImageCell: UITableViewCell {

    
    @IBOutlet weak var yourImageView: UIImageView!
    
    @IBOutlet weak var yourImageLabel: UILabel!
    
    @IBOutlet weak var yourName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
