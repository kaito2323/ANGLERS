//
//  MessageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var myNameText: UILabel!
    
    @IBOutlet weak var myMessageText: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.backgroundColor = UIColor.clear
        //角丸にする
        self.myMessageText.layer.cornerRadius = 10
        self.myMessageText.clipsToBounds = true
        
        self.myMessageText.adjustsFontSizeToFitWidth = true

        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

