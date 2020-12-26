//
//  FishDataModel.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore




class FishDataModel {
    
    var dashbord = Firestore.firestore()

    
    init() {
        
    }
  



    func fishImageData(data1:Data,nameData:String,fishPlace:String,email:String,userName:String,comment:String){
        //ストレージサーバのfishImageに保存
        let imageRef = Storage.storage().reference().child("fishImage").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        
        //storageサーバーにデータを送る
        imageRef.putData(data1, metadata: nil) { (metaData, error) in
            
            if error != nil{
               
                print(error.debugDescription)
                return
            }
            
            
            //ここのurlはstorageサーバーから返ってきたurl
            imageRef.downloadURL { [self] (url, error) in
                
                if error != nil{
                    
                    print(error.debugDescription)
                    return
                }
                
                
                
        
                dashbord.collection("FishName").document().setData(["fishName":nameData ,"fishImage":url?.absoluteString as Any,"fishPlace":fishPlace,"docID": email,"userName": userName,"comment":comment,"postDate":Date().timeIntervalSince1970])

                
            }
            
        }
        
        
    }
    
}
