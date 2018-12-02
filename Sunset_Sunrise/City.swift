//
//  City.swift
//  Sunset_Sunrise
//
//  Created by Benko Ostap on 27.11.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import Foundation

class City{
    let lat: Float
    let lng: Float
    let name: String
    var sunrise: String?
    var sunset: String?
    init(lat: Float, lng: Float, name: String) {
        self.lat = lat
        self.lng = lng
        self.name = name
    }
}

