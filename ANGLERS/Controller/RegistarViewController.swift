//
//  RegistarViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import Firebase
import FirebaseAuth


class RegistarViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var mailAddress: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailAddress.delegate = self
        passWord.delegate = self
        
        
    }
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //リターンキーを押した時にキーボードを閉じる
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //キーボードが閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    
    
    
    
    //登録
    
    @IBAction func registar(_ sender: Any) {
        
        //mailAddressが空でないのとpassWord空でないかを確認
        
        
        Auth.auth().createUser(withEmail: mailAddress.text!, password: passWord.text!) { [self] (result, error) in
            
            if let user = result?.user {
                let req = user.createProfileChangeRequest()
                req.displayName = userName.text
                req.commitChanges { (error) in
                    
                    if error != nil{
                        
                        print(error.debugDescription)
                        
                    }else{
                        
                        print("完了しました")
                        
                    }
                }
                
                
                
                
            }
            
            
            if error != nil{
                
                print(error.debugDescription)
                return
                
            }else{
                print(result?.description)
                print("ユーザーの作成が完了しました")
                
                self.mailAddress.text = ""
                self.passWord.text = ""
                self.userName.text = ""
                
                //画面遷移をする
                self.performSegue(withIdentifier: "top", sender: nil)
              
                
                
            }
            
            
            
            
        }
        
        
    }
    
    
    
    
    
    
}

