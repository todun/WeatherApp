//
//  String.swift
//  WeatherApp
//
//  Created by emile on 15/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation


// Mark: - String to Date
extension String {
	
	func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
		
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
		dateFormatter.dateFormat = format
		
		guard let date = dateFormatter.date(from: self) else {
			print("Take a look to your format")
			return nil
		}
		
		return date
	}
}

// MARK: - Capitalize First Letter
extension String {
	
	func capitalizingFirstLetter() -> String {
		return prefix(1).uppercased() + self.lowercased().dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
}
