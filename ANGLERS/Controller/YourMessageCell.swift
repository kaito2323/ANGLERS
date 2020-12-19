//
//  YourMessageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class YourMessageCell: UITableViewCell {

    
    @IBOutlet weak var yourNameText: UILabel!
    
    @IBOutlet weak var yourMessageText: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        
        self.yourMessageText.layer.cornerRadius = 10
        self.yourMessageText.clipsToBounds = true
        
//        self.yourMessageText.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

