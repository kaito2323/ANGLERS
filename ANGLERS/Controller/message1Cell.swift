//
//  message1Cell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class message1Cell: UITableViewCell {
  
    @IBOutlet weak var rightNameLabel: UILabel!
    
    @IBOutlet weak var leftNameLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var talkLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
