//
//  LocationVC.swift
//  UNIamoci
//
//  Created by Gabriele Ruini on 24/07/18.
//  Copyright © 2018 Gabriele Ruini. All rights reserved.
//

import UIKit
import CoreLocation


class LocationVC: UIViewController {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var placeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
      
    }
    
    @IBAction func useCurrentLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
}


extension LocationVC : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            print("lat: \(lat), long: \(long)")
            lookUpCurrentLocation { (geoLoc) in
                print(geoLoc.locality ?? "Unknow Geo location")
                self.placeField.text = geoLoc.locality! + ", " + geoLoc.postalCode! + ", " + geoLoc.isoCountryCode!
    
            }
        } else {
            print("No coordinates")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark) -> Void ) {
        // use the last reported location
        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            
            //look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation!)
                }
                else {
                    // an error occured during geocoding
                    print("An error occured")
                }
            })
        }
        else {
            // no location was avaible
            print("An error occured")
        }
    }
}

