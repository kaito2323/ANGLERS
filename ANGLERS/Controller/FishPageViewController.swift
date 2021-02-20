//
//  FishPageViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseFirestore


class FishPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dashBord1 = Firestore.firestore()
    
    var dataSets:[FishLists] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MyImageCell", bundle: nil), forCellReuseIdentifier: "myImageCell")
        tableView.register(UINib(nibName: "YourImageCell", bundle: nil), forCellReuseIdentifier: "yourImageCell")
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        self.parent?.navigationItem.title = "みんなの投稿"
        
        loadData()
    }
    
    
    
    
    func loadData(){
        
        
        dashBord1.collection("FishName").order(by: "postDate").addSnapshotListener { (snapshot, error) in
            
            self.dataSets = []
            if error != nil{
                
                return
                
            }
            
            
            
            if let snapShotDoc = snapshot?.documents{
                
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    if let fishName = data["fishName"] as? String,let fishImage = data["fishImage"]as? String,let fishPlace = data["fishPlace"]as? String,
                       let docID = data["docID"]as? String,let userName = data["userName"]as? String,let comment = data["comment"]as? String {
                        
                        
                        
                        let fishs = FishLists(fishName: fishName, fishImage: fishImage, fishPlace: fishPlace, docID: docID, userName: userName, comment: comment)
                        
                        
                        
                        self.dataSets.append(fishs)
                        
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }
        
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSets.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let doc = dataSets[indexPath.row]
        
       
        
        if doc.docID == Auth.auth().currentUser?.email{
            
            
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myImageCell", for: indexPath) as! MyImageCell
            
            myCell.myImageLabel.text = dataSets[indexPath.row].fishName
            
            myCell.myImageView.sd_setImage(with: URL(string: dataSets[indexPath.row].fishImage), completed: nil)
            
            myCell.myName.text = dataSets[indexPath.row].userName
            
            
            return myCell
            
        }else{
            
            
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourImageCell", for: indexPath) as! YourImageCell
            
            yourCell.yourImageLabel.text = dataSets[indexPath.row].fishName
            
            yourCell.yourImageView.sd_setImage(with: URL(string: dataSets[indexPath.row].fishImage), completed: nil)
            
            yourCell.yourName.text = dataSets[indexPath.row].userName
            
            
            return yourCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fishDataVC = (storyboard?.instantiateViewController(identifier: "FishData"))! as FishDataViewController
        
        
        fishDataVC.shareName1 = dataSets[indexPath.row].fishName
        
        fishDataVC.shareImage1 = dataSets[indexPath.row].fishImage
        
        fishDataVC.sharePlace1 = dataSets[indexPath.row].fishPlace
        
        fishDataVC.commentData = dataSets[indexPath.row].comment
        
        navigationController?.pushViewController(fishDataVC, animated: true)
        
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 100
        
        
        
    }
    
    
    
}

