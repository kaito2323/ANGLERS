//
//  MyImageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class MyImageCell: UITableViewCell {

    
    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var myImageLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
