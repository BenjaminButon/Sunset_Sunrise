//
//  ViewController.swift
//  Sunset_Sunrise
//
//  Created by Benko Ostap on 27.11.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import UIKit
import Foundation


class MainViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    var cities: [City] = [City]()
    
    var query: QueryService?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.dataSource = self
        query = QueryService()
        query?.view = self
        cities.append(City(lat: 36.7201600, lng: -4.4203400, name: "Хуй зна"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        cities.append(City(lat: 49.838300, lng: 24.0232, name: "Lviv"))
        query?.getRequestData(cities: &self.cities)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCity", let addView = segue.destination as? AddCityController{
            addView.superView = self
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell{
            cell.nameLbl.text = self.cities[indexPath.row].name
            cell.sunriseLbl.text = String(self.cities[indexPath.row].sunrise ?? "Searching...")
            cell.sunsetLbl.text = String(self.cities[indexPath.row].sunset ?? "Searching...")
        return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

