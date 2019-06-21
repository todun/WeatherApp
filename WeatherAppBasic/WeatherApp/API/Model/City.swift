//
//  City.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation
import CoreLocation

struct City {

	let id: Int
	let name: String
	let country: String
	let population: Int
	let timeZone: Int
	let coordinate: Coordinate
	let forecasts: [Array<Forecast>.DatedItem]
}

// MARK: Helpers
extension City {
	
	var location: CLLocationCoordinate2D {
		return CLLocationCoordinate2D(coordinate)
	}
	
	var next24hours: [Forecast] {
		var tmpArr = forecasts.flatMap { $0.items }
		tmpArr.removeFirst()
		return Array(tmpArr[..<8])
	}
}

// MARK: - Codable
extension City: Codable {
	
	// Response
	enum ResponseCodingKeys: String, CodingKey {
		case city, forecasts = "list"
	}
	
	// City
	enum CityCodingKeys: String, CodingKey {
		case id, name, country, population, timeZone = "timezone", coordinate = "coord"
	}
	
	init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: ResponseCodingKeys.self)
		let cityContainer = try container.nestedContainer(keyedBy: CityCodingKeys.self, forKey: .city)
		
		id = try cityContainer.decode(Int.self, forKey: .id)
		name = try cityContainer.decode(String.self, forKey: .name)
		country = try cityContainer.decode(String.self, forKey: .country)
		population = try cityContainer.decode(Int.self, forKey: .population)
		timeZone = try cityContainer.decode(Int.self, forKey: .timeZone)
		coordinate = try cityContainer.decode(Coordinate.self, forKey: .coordinate)
		forecasts = try container.decode([Forecast].self, forKey: .forecasts).groupedByDay
	}
	
	func encode(to encoder: Encoder) throws {
		
		var container = encoder.container(keyedBy: ResponseCodingKeys.self)
		var cityContainer = container.nestedContainer(keyedBy: CityCodingKeys.self, forKey: .city)
		
		try cityContainer.encode(id, forKey: .id)
		try cityContainer.encode(name, forKey: .name)
		try cityContainer.encode(country, forKey: .country)
		try cityContainer.encode(population, forKey: .population)
		try cityContainer.encode(timeZone, forKey: .timeZone)
		try cityContainer.encode(coordinate, forKey: .coordinate)
		try container.encode(forecasts.flatMap { $0.items }, forKey: .forecasts)
	}
}
