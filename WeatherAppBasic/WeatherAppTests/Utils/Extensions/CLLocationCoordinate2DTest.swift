//
//  CLLocationCoordinate2DTest.swift
//  WeatherAppTests
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherApp

class CLLocationCoordinate2DTest: XCTestCase {

    func testCLLocationCoordinate2D() {
		
		let coordinate = Coordinate(latitude: 55, longitude: 66)
		let coordinate2D = CLLocationCoordinate2D(coordinate)
		
		XCTAssertNotNil(coordinate2D)
		XCTAssertEqual(coordinate2D.latitude, 55)
		XCTAssertEqual(coordinate2D.longitude, 66)
    }
}
