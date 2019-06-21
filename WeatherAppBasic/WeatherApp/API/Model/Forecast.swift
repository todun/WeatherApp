//
//  Forecast.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

struct Forecast: Dated {

	let date: Date
	let temperature: Temperature
	let pressure: Pressure
	let humidity: Int
	let weather: Weather?
	let clouds: Int
	let wind: Wind
}

// MARK: Helpers
extension Forecast {
	
}

// MARK: - Codable
extension Forecast: Codable {
	
	// Forecast
	enum ForecastCodingKeys: String, CodingKey {
		case date = "dt", main, weather, clouds, wind
	}
	
	// Temperature
	enum TemperatureCodingKeys: String, CodingKey {
		case value = "temp", min = "temp_min", max = "temp_max"
	}
	
	// Humidity
	enum HumidityCodingKeys: String, CodingKey {
		case humidity
	}
	
	// Clouds
	enum CloudsCodingKeys: String, CodingKey {
		case all
	}
	
	init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: ForecastCodingKeys.self)
		let humidityContainer = try container.nestedContainer(keyedBy: HumidityCodingKeys.self, forKey: .main)
		let cloudsContainer = try container.nestedContainer(keyedBy: CloudsCodingKeys.self, forKey: .clouds)
		
		date = try container.decode(Date.self, forKey: .date)
		temperature = try container.decode(Temperature.self, forKey: .main)
		pressure = try container.decode(Pressure.self, forKey: .main)
		humidity = try humidityContainer.decode(Int.self, forKey: .humidity)
		clouds = try cloudsContainer.decode(Int.self, forKey: .all)
		wind = try container.decode(Wind.self, forKey: .wind)
		
		let weatherTmp = try container.decode([Weather].self, forKey: .weather)
		weather = weatherTmp.first
	}
	
	func encode(to encoder: Encoder) throws {
		
		var container = encoder.container(keyedBy: ForecastCodingKeys.self)
		var humidityContainer = container.nestedContainer(keyedBy: HumidityCodingKeys.self, forKey: .main)
		var cloudsContainer = container.nestedContainer(keyedBy: CloudsCodingKeys.self, forKey: .clouds)
		
		try container.encode(date, forKey: .date)
		try container.encode(temperature, forKey: .main)
		try container.encode(pressure, forKey: .main)
		try humidityContainer.encode(humidity, forKey: .humidity)
		try container.encode(weather, forKey: .weather)
		try cloudsContainer.encode(clouds, forKey: .all)
		try container.encode(wind, forKey: .wind)
	}
}
