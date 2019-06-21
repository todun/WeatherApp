//
//  WindTest.swift
//  WeatherAppTests
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WindTest: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testCompassDirectionN() {
		XCTAssertEqual(Wind(speed: 10, degrees: 0).compassDirection, "N")
    }
	
	func testCompassDirectionNE() {
		XCTAssertEqual(Wind(speed: 10, degrees: 45).compassDirection, "NE")
	}
	
	func testCompassDirectionE() {
		XCTAssertEqual(Wind(speed: 10, degrees: 90).compassDirection, "E")
	}
	
	func testCompassDirectionSE() {
		XCTAssertEqual(Wind(speed: 10, degrees: 135).compassDirection, "SE")
	}
	
	func testCompassDirectionS() {
		XCTAssertEqual(Wind(speed: 10, degrees: 180).compassDirection, "S")
	}
	
	func testCompassDirectionSW() {
		XCTAssertEqual(Wind(speed: 10, degrees: 225).compassDirection, "SW")
	}
	
	func testCompassDirectionW() {
		XCTAssertEqual(Wind(speed: 10, degrees: 270).compassDirection, "W")
	}
	
	func testCompassDirectionNW() {
		XCTAssertEqual(Wind(speed: 10, degrees: 315).compassDirection, "NW")
	}
}
