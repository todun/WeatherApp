//
//  CoordinateTest.swift
//  WeatherAppTests
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherApp

class CoordinateTest: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testCoordinate() {
		
		let coordinate2D = CLLocationCoordinate2D(latitude: 55, longitude: 66)
		let coordinate = Coordinate(coordinate2D)
		
		
		XCTAssertNotNil(coordinate)
		XCTAssertEqual(coordinate.latitude, 55)
		XCTAssertEqual(coordinate.longitude, 66)
		
    }
}
