//
//  Temperature.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

struct Temperature: Codable, TemperatureSortable {
	
	// Custom property names
	enum CodingKeys: String, CodingKey {
		case mid = "temp", min = "temp_min", max = "temp_max"
	}
	
	let mid: Float
	let min: Float
	let max: Float
}
