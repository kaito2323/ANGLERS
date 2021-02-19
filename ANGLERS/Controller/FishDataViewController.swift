//
//  FishDataViewController.swift
//  ANGLERS
//
//  Created by kaito12 on 2020/12/16.
//

import UIKit
import SDWebImage
import CoreLocation
import MapKit


class FishDataViewController: UIViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBOutlet weak var fishDataName: UILabel!
    
    
    @IBOutlet weak var fishDataImage: UIImageView!
    
    
    @IBOutlet weak var commentText: UITextView!
    
    @IBOutlet weak var sharePlaceLabel: UILabel!
    
    
    var shareName1:String = ""
    
    var shareImage1:String = ""
    
    var sharePlace1:String = ""
    
    var commentData:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fishDataName.text = shareName1
        
        fishDataImage.sd_setImage(with: URL(string: shareImage1), completed: nil)
        
        sharePlaceLabel.text = sharePlace1
        
        commentText.text = commentData
        
        mapSearch()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    

    
    func mapSearch() {
        
        if let searchKey = sharePlaceLabel.text {
            
            print(searchKey)
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey) { (placemarks, error) in
                

                            
                if let unwrapPlacemarks = placemarks {
                    if let firstPlacemarks = unwrapPlacemarks.first {

                        if let location = firstPlacemarks.location {
                    
                            
                            let targetCoordinate = location.coordinate

                            print(targetCoordinate)
                            
                 

                            let pin = MKPointAnnotation()

                            pin.coordinate = targetCoordinate

                            pin.title = searchKey

                            self.mapView.addAnnotation(pin)

                            self.mapView.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 1000.0, longitudinalMeters: 1000.0)

                        }



                    }


                }
            }
            
            
        }
        
    }
  
    
    
}

