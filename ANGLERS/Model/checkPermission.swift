//
//  checkPermission.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import Foundation
import Photos

class CheckPermission {
    
    //ユーザに許可を出す
    func checkCamera(){
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
            
            //許可されてますよ
            case.authorized:
                print("authorized")
            //決まってません
            case.notDetermined:
                print("notDetermined")
                
            case.restricted:
                print("restricted")
            //拒否されました
            case.denied:
                print("denied")
                
            case.limited:
                print("limited")
                
            default:break
                
            }
        }
        
    }
    
}

