//
//  DateTest.swift
//  WeatherAppTests
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
@testable import WeatherApp

class DateTest: XCTestCase {

    func testToString() {

		let date = "2019-05-25".toDate()
		
		XCTAssertNotNil(date?.toString())
		XCTAssertEqual(date?.toString(), "2019-05-25")
    }
}
