//
//  ArrayTests.swift
//  WeatherAppTests
//
//  Created by emile on 15/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
@testable import WeatherApp

class ArrayTests: XCTestCase {

	struct Item: Dated { let date: Date }
	
	var arrToGroup: [Item]?
	var temperatureArr: [Temperature]?
	
    override func setUp() {
		
		arrToGroup = [Item(date: "2019-05-25".toDate()!),
					  
					  Item(date: "2019-05-26".toDate()!),
					  Item(date: "2019-05-26".toDate()!),
					  
					  Item(date: "2019-05-27".toDate()!),
					  Item(date: "2019-05-27".toDate()!),
					  Item(date: "2019-05-27".toDate()!)]
		
		temperatureArr = [Temperature(mid: 200, min: 100, max: 300),
						  Temperature(mid: 300, min: 200, max: 400),
						  Temperature(mid: 400, min: 300, max: 500),
						  Temperature(mid: 500, min: 400, max: 600),
						  Temperature(mid: 600, min: 500, max: 700)]
	}

    override func tearDown() {
		
		arrToGroup = nil
		temperatureArr = nil
	}

    func testGroupedByDay() {
		
		guard let arr = arrToGroup else {
			XCTFail()
			return
		}
		
		let arrGrouped = arr.groupedByDay
		
		XCTAssertEqual(arrGrouped.count, 3, "Check if the array has 3 entries")
		
		XCTAssertEqual(arrGrouped[0].1.count, 1)
		XCTAssertEqual(arrGrouped[1].1.count, 2)
		XCTAssertEqual(arrGrouped[2].1.count, 3)
		
		XCTAssertEqual("2019-05-25", arrGrouped[0].0.toString())
    }
	
	func testTemperatureMid() {
		
		guard let arr = temperatureArr else {
			XCTFail()
			return
		}
		
		XCTAssertEqual(arr.temperatureMid.int, 20)
		XCTAssertEqual(arr.temperatureMid.string, "20°")
		XCTAssertEqual([Temperature]().temperatureMid.int, 0)
		XCTAssertEqual([Temperature]().temperatureMid.string, "0°")
	}
	
	func testTemperatureMin() {
		
		guard let arr = temperatureArr else {
			XCTFail()
			return
		}
		
		XCTAssertEqual(arr.temperatureMin.int, 10)
		XCTAssertEqual(arr.temperatureMin.string, "10°")
		XCTAssertEqual([Temperature]().temperatureMin.int, 0)
		XCTAssertEqual([Temperature]().temperatureMin.string, "0°")
	}
	
	func testTemperatureMax() {
		
		guard let arr = temperatureArr else {
			XCTFail()
			return
		}
		
		XCTAssertEqual(arr.temperatureMax.int, 70)
		XCTAssertEqual(arr.temperatureMax.string, "70°")
		XCTAssertEqual([Temperature]().temperatureMax.int, 0)
		XCTAssertEqual([Temperature]().temperatureMax.string, "0°")
	}
}
