//
//  QueryService.swift
//  Sunset_Sunrise
//
//  Created by Benko Ostap on 28.11.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import Foundation
import UIKit

class QueryService{
    var view: MainViewController?
    
    func getSunData(cities: inout [City]) {
        for city in cities{
            let urlString = "https://api.sunrise-sunset.org/json?lat=" + String(city.lat) + "&lng=" + String(city.lng)
            let url = URL(string: urlString)!
            let task = URLSession.shared.dataTask(with: url){data, response, error in
                if let error = error {
                    self.showError(error.localizedDescription)
                }
                guard let responseData = response as? HTTPURLResponse, (200...299).contains(responseData.statusCode) else {
                    self.showError("something with response")
                    return
                }
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                print(json.debugDescription)
                if let jsonDictionary = json as? [String: Any]{
                    print(jsonDictionary.debugDescription)
                    print("\n\n")
                    if let results = jsonDictionary["results"] as? [String: String]{
                        guard let sunrise = results["sunrise"] else { return}
                        guard let sunset = results["sunset"] else { return}
                        city.sunrise = sunrise
                        city.sunset = sunset
                        print("Received data")
                        DispatchQueue.main.async {
                            self.view?.tableView.reloadData()
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func getCoordinates(cityName: String){
        print("зайшло")
        let urlString = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=" + cityName + "&inputtype=textquery&fields=geometry&key=AIzaSyCCv7Jfl1jMU3RbxJD8GFxE_EBiPk9KBT0"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error {
                self.showError(error.localizedDescription)
            }
            guard let responseData = response as? HTTPURLResponse, (200...299).contains(responseData.statusCode) else {
                self.showError("something with response")
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let jsonDictionary = json as? [String : Any]{
                guard jsonDictionary["status"] as? String == "OK" else {
                    print("bad status")
                    return
                    
                }
                if let candidates = jsonDictionary["candidates"] as? [Any]{
                    if let firstCandidate = candidates[0] as? [String : Any]{
                        if let geometry = firstCandidate["geometry"] as? [String : Any]{
                            print("ok geometry")
                            if let location = geometry["location"] as? [String : Double]{
                                DispatchQueue.main.async {
                                    self.view?.cities.append(City(lat: location["lat"]!, lng: location["lng"]!, name: cityName))
                                    self.view?.reload()
                                }
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
    func showError(_ error: String){
        let alertControler = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        
        alertControler.addAction(action)
        
        self.view?.present(alertControler, animated: true)
        
    }
}
