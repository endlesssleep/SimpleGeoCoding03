
//
//  ViewController.swift
//  SimpleGeoCoding03
//
//  Created by D7703_07 on 2019. 10. 11..
//  Copyright © 2019년 1234. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var pins = [MKPointAnnotation]()
        let addr1 = "부산광역시 양정동 429-10"
        let addr2 = "부산광역시 전포동 2-59"
        
        // GeoCoder 클래스 객체 하나 생성
        let fGeocoder1 = CLGeocoder()
        let fGeocoder2 = CLGeocoder()
        
        //Closure

//        fGeocoder.geocodeAddressString(addr, completionHandler: {(placemarks:[CLPlacemark]?, error: Error?) in
//
//          if error != nil {
//            print("Unable to geocoding \(error!)")
//      }
//
//    if let myPlacemark = placemarks {
//      let placemark = myPlacemark[0]
//
//    print(placemark.location?.coordinate)
//
//     }
//
//  })

        //trailing closure
        fGeocoder1.geocodeAddressString(addr1)  {placemarks, error in
            
            if error != nil {
                print("Unable to geocoding \(error!)")
            }
            
            if let myPlacemark = placemarks {
                let placemark = myPlacemark[0]
                let pin01 = MKPointAnnotation()
                pin01.coordinate = placemark.location!.coordinate
                pin01.title = "동의과학대학교"
                pin01.subtitle = "우리들의꿈이 자라는 곳"
                pins.append(pin01)
                self.mapView.showAnnotations(pins, animated: true)
                
            }
        
        }
            fGeocoder2.geocodeAddressString(addr2)  {placemarks, error in
                
                if error != nil {
                    print("Unable to geocoding \(error!)")
                }
            
            if let myPlacemark = placemarks {
                let placemark = myPlacemark[0]
                let pin02 = MKPointAnnotation()
                pin02.coordinate = placemark.location!.coordinate
                pin02.title = "송상현광장"
                pin02.subtitle = ""
                pins.append(pin02)
                self.mapView.showAnnotations(pins, animated: true)
                
                }
            
            }

        }
    }

