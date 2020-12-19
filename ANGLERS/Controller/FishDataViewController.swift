//
//  FishDataViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import SDWebImage


class FishDataViewController: UIViewController {

    
    @IBOutlet weak var fishDataName: UILabel!
    
  
    @IBOutlet weak var fishDataImage: UIImageView!
    
    
    @IBOutlet weak var commentText: UITextView!
    
    @IBOutlet weak var sharePlaceLabel: UILabel!
    
    var shareName1:String = ""
    
    var shareImage1:String = ""
    
    var sharePlace1:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        fishDataName.text = shareName1
        
        fishDataImage.sd_setImage(with: URL(string: shareImage1), completed: nil)
        
        sharePlaceLabel.text = sharePlace1
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let image = fishDataImage.image?.jpegData(compressionQuality: 0.1)
        
        let comment = commentText.text
        
        let item = [image,comment as Any]
        
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    

 
}

