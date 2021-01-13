//
//  YourMessageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/24.
//

import UIKit

class YourMessageCell: UITableViewCell {
    
    var yourMessage: String?{
        didSet{
            let width = estimateFrameForTextView(text: yourMessage!).width + 20
            
            yourMessageTextViewWidthConstraint.constant = width
            yourMessageText.text = yourMessage
        }
        
    }
    
    
    
    @IBOutlet weak var yourMessageTextViewWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var yourNameLabel: UILabel!
    
    @IBOutlet weak var yourMessageText: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yourMessageText.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        self.backgroundColor = UIColor.clear
        
        self.yourMessageText.layer.cornerRadius = 10
        self.yourMessageText.clipsToBounds = true
        
    }
    
    
    func estimateFrameForTextView(text: String) -> CGRect{
        
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
    }
}
