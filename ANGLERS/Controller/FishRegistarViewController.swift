//
//  FishRegistarViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import Firebase
import FirebaseAuth
import Photos
import FirebaseFirestore



class FishRegistarViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var fishPlace: UITextField!
    
    
    @IBOutlet weak var fishNameTextField: UITextField!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    
    @IBOutlet weak var fishSelectImageView: UIImageView!
    
    
    
    var fishDataModel = FishDataModel()
    
    var dashBord1 = Firestore.firestore()
    
    var userID = String()
    
    
    var idString = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fishNameTextField.delegate = self
        
        let checkPermission = CheckPermission()
        
        checkPermission.checkCamera()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.parent?.navigationItem.title = "写真を投稿しよう！"
        
        self.parent?.navigationItem.hidesBackButton = true

        
        //
        if UserDefaults.standard.object(forKey: "documentID") != nil{
            
            
            idString = UserDefaults.standard.object(forKey: "documentID") as! String
            
            
        }else{
            
            idString = dashBord1.collection("FishName").document().path
            print(idString)
            
            idString = String(idString.dropFirst(9))
            UserDefaults.standard.setValue(idString, forKey: "documentID")
            
        }
        //
        
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
    
    
    @IBAction func logOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        
        do {
            try firebaseAuth.signOut()
            
            let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as! LoginViewController
            self.navigationController?.pushViewController(loginVC, animated: true)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    
    //釣果登録を押すと
    @IBAction func fishRegistar(_ sender: Any) {
        
        
        if fishNameTextField.text?.isEmpty != true ,let image = fishSelectImageView.image{
            
            let data = image.jpegData(compressionQuality: 0.1)
            
            
            
            fishDataModel.fishImageData(data1: data!, nameData: fishNameTextField.text!,fishPlace: fishPlace.text!,email: (Auth.auth().currentUser?.email)!,userName: (Auth.auth().currentUser?.displayName)!, comment: commentTextField.text!)

           
            
            
        }
        //FishListViewControllerに移動する
        performSegue(withIdentifier: "FishList", sender: nil)
        
        fishPlace.text = ""
        fishNameTextField.text = ""
        commentTextField.text = ""
        fishSelectImageView.image = UIImage(named: "fishimage")
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "FishList", sender: nil)
    }
    
    
    
    
    
    @IBAction func cameraAction(_ sender: Any) {
        
        showAlert()
    }
    
    //カメラ立ち上げメソッド
    func camera(){
        
        let sourceType:UIImagePickerController.SourceType = .camera
        
        //カメラ利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    
    //アルバム
    func album(){
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        
        //アルバムを利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            
        }
        
        
    }
    //カメラやアルバムで選んだ写真撮った写真はここに入ってくる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if info[.originalImage] as? UIImage != nil{
            
            let selectedImage = info[.originalImage] as! UIImage
            fishSelectImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    //カメラのキャンセルが押された時に発動する
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    //カメラかアルバムを選ぶメソッド
    func showAlert(){
        
        
        let alertController = UIAlertController(title: "", message: "カメラかアルバムを選択してください", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "カメラで撮影", style: .default) { (alert) in
            self.camera()
        }
        
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            self.album()
        }
        
        
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
}


