//
//  ChatViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import Firebase
import FirebaseFirestore
import SDWebImage

class ChatViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
    
    let dashBord = Firestore.firestore()
    
    var roomName = String()
    
    var imageString = String()
    
    var messageData:[MessageData] = []
    
    var user = Auth.auth().currentUser?.displayName
    
    
    
    
    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.isEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        
        
        tableView.register(UINib(nibName: "YourMessageCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        
        tableView.register(UINib(nibName: "MyMessageCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        
        
        roomName = "みんなで話そうよ！"
        
        self.parent?.navigationItem.title = roomName
     
        
        loadMessages(roomName: roomName)
        //cellをタップできなくする
        tableView.allowsSelection = false
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        
        roomName = "みんなで話そうよ！"
        loadMessages(roomName: roomName)
        
    }
    
    
    
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if messageTextField.text == "" {
            
            sendButton.isEnabled = false
            
        }else{
            
            sendButton.isEnabled = true
        }
        
    }
    
    //リターンキーを押した時にキーボードを閉じる
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //キーボードが閉じる
        textField.resignFirstResponder()
        
        
        
        
        
        return true
    }
    
    
    
    func loadMessages(roomName:String){
        
        dashBord.collection(roomName).order(by: "date").addSnapshotListener { (snapShot, error) in
            
            self.messageData = []
            
            if error != nil{
                
                return
                
            }
            //データを拾ってくる
            if let snapShotDoc = snapShot?.documents{
                
                for doc in snapShotDoc {
                    
                    let data = doc.data()
                    if let sender = data["sender"] as? String,let body = data["body"] as? String,let user = data["user"] as? String{
                        
                        let newMessage = MessageData(sender: sender, body: body, user: user)
                        
                        self.messageData.append(newMessage)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: self.messageData.count - 1, section: 0)
                            //強制的にメッセージが打たれたら下に来るようにしている
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            
                            
                            
                        }
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let message = messageData[indexPath.row]
        
        if message.sender == Auth.auth().currentUser?.email{
            
            
            
            
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyMessageCell
            
            myCell.myNameLabel.text = messageData[indexPath.row].user
            
            myCell.messageText = messageData[indexPath.row].body
            
            myCell.layer.cornerRadius = 15
            
            return myCell
            
            
            
            
            
        }else{
            
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourMessageCell
            
            yourCell.yourNameLabel.text = messageData[indexPath.row].user
            yourCell.yourMessage = messageData[indexPath.row].body
            
            yourCell.layer.cornerRadius = 15
            
            return yourCell
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        tableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
        
        
    }
    
    @IBAction func send(_ sender: Any) {
        
        //送信
        
        
        if let messageText = messageTextField.text,let sender = Auth.auth().currentUser?.email{
            
            
            dashBord.collection(roomName).addDocument(data: ["sender":sender,"body":messageText,"user":Auth.auth().currentUser?.displayName as Any,"date":Date().timeIntervalSince1970]) { [self] (error) in
                
                
                
                if error != nil{
                    
                    print(error.debugDescription)
                    return
                }
                
                
                
                DispatchQueue.main.async {
                    
                    self.messageTextField.text = ""
                    self.sendButton.isEnabled = false
                    self.messageTextField.resignFirstResponder()
                    
                    
                }
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    
}

