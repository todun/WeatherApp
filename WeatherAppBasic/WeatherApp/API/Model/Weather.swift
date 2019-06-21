//
//  Weather.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

struct Weather: Codable {
	
	let id: Int
	let main: String
	let description: String
	let icon: String
}

