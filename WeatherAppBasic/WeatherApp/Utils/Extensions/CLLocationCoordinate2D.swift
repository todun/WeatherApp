//
//  CLLocationCoordinate2D.swift
//  WeatherApp
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
	init(_ coordinate: Coordinate) {
		self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
	}
}
