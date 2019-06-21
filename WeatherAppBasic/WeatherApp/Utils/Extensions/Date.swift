//
//  Date.swift
//  WeatherApp
//
//  Created by emile on 15/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

extension Date {
	
	func toString(withFormat format: String = "yyyy-MM-dd") -> String {
		
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
		dateFormatter.dateFormat = format
		
		return dateFormatter.string(from: self)
	}
}
