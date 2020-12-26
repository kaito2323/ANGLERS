//
//  TalkRoomListViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit

class TalkRoomListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var listTableView: UITableView!
    
    var roomNameArray = ["好きな釣りポイント","釣り初心者","おすすめポイント","釣った魚を自慢しよう"]
    var roomImageArray = ["1","2","3","4"]
    var navTitle = "トークルーム"

    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.delegate = self
        listTableView.dataSource = self
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false

        self.parent?.navigationItem.title = navTitle

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomNameArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: roomImageArray[indexPath.row])
        
        cell.textLabel?.text = roomNameArray[indexPath.row]
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "talkChatVC", sender: indexPath.row)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let talkChatVC = segue.destination as! TalkRoomChatViewController
        talkChatVC.roomName = roomNameArray[sender as! Int]
    }

}

