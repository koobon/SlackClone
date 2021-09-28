//
//  GeoLocation+Address.swift
//  Pay Manager
//
//  Created by swany on 2020/06/01.
//  Copyright © 2020 Swan. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

// 주소로 변환하기
func getLocationToAddress(lati: Double, longi: Double, completion: @escaping (String)->()) {
    let geoLocation = CLLocation(latitude: lati, longitude: longi)
    let geoCoder = CLGeocoder()
    geoCoder.reverseGeocodeLocation(geoLocation, completionHandler: { (placemarks, error) in
        if error != nil {
            return
        }
        
        if let placemark = placemarks?.first {
            if let addressDictionary = placemark.addressDictionary {
                if let address = addressDictionary["FormattedAddressLines"] as? [String] {
                    completion(address.first ?? "")
                }
            }
        }
    })
}
