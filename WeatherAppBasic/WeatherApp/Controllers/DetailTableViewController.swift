//
//  DetailTableViewController.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
	
	var city: City?
	var forecast: Forecast?
	
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var minTempLabel: UILabel!
	@IBOutlet weak var maxTempLabel: UILabel!
	
	@IBOutlet weak var humidityLabel: UILabel!
	
	@IBOutlet weak var seaPressureLabel: UILabel!
	@IBOutlet weak var groundPressureLabel: UILabel!
	
	@IBOutlet weak var conditionsLabel: UILabel!
	
	@IBOutlet weak var windSpeedLabel: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(animated)
	
		setupView()
	}
	
	private func setupView() {
	
		self.navigationItem.largeTitleDisplayMode = .never
		
		guard let forecast = forecast, let city = city else {
			return
		}
		
		self.title = "\(city.name), \(city.country)"
		
		tempLabel.text = "\(Int(forecast.temperature.mid)/10)°"
		minTempLabel.text = "\(Int(forecast.temperature.min)/10)°"
		maxTempLabel.text = "\(Int(forecast.temperature.max)/10)°"
		
		humidityLabel.text = "\(forecast.humidity)%"
		
		seaPressureLabel.text = "\(Int(forecast.pressure.value)) hPa"
		groundPressureLabel.text = "\(Int(forecast.pressure.groundLevel)) hPa"
		
		conditionsLabel.text = forecast.weather?.description.capitalizingFirstLetter() ?? "N/A"
		
		windSpeedLabel.text = "\(forecast.wind.speed) m/s"
	}
}
