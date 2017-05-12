//
//  ViewController.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/8/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var weatherFetcher: WeatherFetcher?
    var isCityCalled = false
    
    
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
     var cities = [City]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherTableView.delegate = self
        self.weatherTableView.dataSource = self
        callWeatherFetch()
    }
    
    func callWeatherFetch() {
        weatherFetcher?.fetch {
            if let cities = $0 {
                self.cities = cities
                self.isCityCalled = true
                
            }
            else {
                let title = "Error"
                let message = "Cannot communicate with the weather server. Check wi-fi or cellular network settings."
                let dismiss = "Dismiss"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: dismiss, style: .default) { _ in
                    alert.dismiss(animated: true, completion: nil)
                })
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cellIdentifier = "weatherCell"
     let cell = weatherTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherTableViewCell
     let city = cities[indexPath.row]
     print("indexPath",[indexPath.row])
     cell.placeLabel.text = city.name
     cell.weatherLabel.text = city.weather
     print("cityWeather",city.weather)
     return cell
    }
    
       
    
    


}

