//
//  Coordinate.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation
import CoreLocation

struct Coordinate: Codable {
	
	// Custom property names
	enum CodingKeys: String, CodingKey {
		case latitude = "lat", longitude = "lon"
	}
	
	let latitude: Double
	let longitude: Double
}

extension Coordinate {
	init(_ coordinate: CLLocationCoordinate2D) {
		self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
	}
}
