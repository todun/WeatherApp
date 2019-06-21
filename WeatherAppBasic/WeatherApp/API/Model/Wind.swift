//
//  Wind.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

struct Wind: Codable {
	
	// Custom property names
	enum CodingKeys: String, CodingKey {
		case speed, degrees = "deg"
	}
	
	let speed: Float
	let degrees: Double
}

// MARK: Helpers
extension Wind {
	
	var compassDirection: String? {
		
		if degrees < 0 { return nil }
		
		let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
		let index = Int((degrees / 45).rounded()) % 8
		
		return directions[index]
	}
	
	var toString: String {
		return "\(compassDirection ?? "") \(speed)ms"
	}
}
