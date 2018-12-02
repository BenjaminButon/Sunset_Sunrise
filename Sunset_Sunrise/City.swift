//
//  City.swift
//  Sunset_Sunrise
//
//  Created by Benko Ostap on 27.11.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import Foundation

class City{
    let lat: Double
    let lng: Double
    let name: String
    var sunrise: String?
    var sunset: String?
    init(lat: Double, lng: Double, name: String) {
        self.lat = lat
        self.lng = lng
        self.name = name
    }
}

