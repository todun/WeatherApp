//
//  Pressure.swift
//  WeatherApp
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

struct Pressure: Codable {
	
	// Custom property names
	enum CodingKeys: String, CodingKey {
		case value = "pressure", seaLevel = "sea_level",  groundLevel = "grnd_level"
	}
	
	let value: Float
	let seaLevel: Float
	let groundLevel: Float
}
