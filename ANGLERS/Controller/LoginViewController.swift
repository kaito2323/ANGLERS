//
//  LoginViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailAddressTextField.delegate = self
        passWordTextField.delegate = self
        
        navigationItem.title = "ログイン画面"
        
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
    
    
    //ログインボタンを押した時
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailAddressTextField.text!, password: passWordTextField.text!) { (result, error) in
            
            if error != nil{
                
                print(error.debugDescription)
                
                let alert = UIAlertController(title: "ログイン出来ません", message: "メールアドレスまたはパスワードが違います", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
                print("ログインできません")
                return
                
            }else{
                
                
                print("ログインが成功しました")
                
                self.emailAddressTextField.text = ""
                self.passWordTextField.text = ""
                
                self.performSegue(withIdentifier: "top", sender: nil)
                
                
                
            }
            
        }
        
    }
    
    
}


