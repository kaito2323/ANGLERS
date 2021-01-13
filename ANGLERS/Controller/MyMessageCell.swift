//
//  MyMessageCell.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/24.
//

import UIKit

class MyMessageCell: UITableViewCell {
    
    var messageText: String?{
        didSet{
            let width = estimateFrameForTextView(text: messageText!).width + 20
            
            messageTextViewWidthConstraint.constant = width
            myMessageText.text = messageText
        }
        
    }
    
    
    
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myNameLabel: UILabel!
    
    @IBOutlet weak var myMessageText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myMessageText.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        self.backgroundColor = UIColor.clear
        
        self.myMessageText.layer.cornerRadius = 10
        self.myMessageText.clipsToBounds = true
        
    }
    func estimateFrameForTextView(text: String) -> CGRect{
        
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
    }
    
    
    
    
}
