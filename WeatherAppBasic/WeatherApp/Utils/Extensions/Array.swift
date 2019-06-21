//
//  Array.swift
//  WeatherApp
//
//  Created by emile on 15/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

// MARK: Group Items by Day
protocol Dated {
	var date: Date { get }
}

extension Array where Element: Dated {
	
	typealias DatedItem = (date: Date, items: [Element])
	
	var groupedByDay: [DatedItem] {
		
		let initial: [Date: [Element]] = [:]
		
		let groupedByDateComponents = reduce(into: initial) { acc, current in
			
			var calendar = Calendar.current
			calendar.timeZone = TimeZone(abbreviation: "GMT")!
			
			let components = calendar.dateComponents([.year, .month, .day], from: current.date)
			let date = calendar.date(from: components)!
			let existing = acc[date] ?? []
			acc[date] = existing + [current]
		}
		
		return groupedByDateComponents.map { (date: $0.key, items: $0.value) }.sorted { $0.date < $1.date }
	}
}

// MARK: Sort Items by Temperature
protocol TemperatureSortable {
	var mid: Float { get }
	var min: Float { get }
	var max: Float { get }
}

extension Array where Element: TemperatureSortable {
	
	var temperatureMid: (int: Int, string: String) {
		let value = Int(self.first?.mid ?? 0)/10
		return (int: value, string: "\(value)°")
	}
	
	var temperatureMin: (int: Int, string: String) {
		let first = self.sorted { $0.min < $1.min }.first?.min
		let value = Int(first ?? 0)/10
		return (int: value, string: "\(value)°")
	}
	
	var temperatureMax: (int: Int, string: String) {
		let first = self.sorted { $0.max > $1.max }.first?.max
		let value = Int(first ?? 0)/10
		return (int: value, string: "\(value)°")
	}
}
