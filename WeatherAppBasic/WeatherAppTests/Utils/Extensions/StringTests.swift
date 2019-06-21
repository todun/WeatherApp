//
//  StringTests.swift
//  WeatherAppTests
//
//  Created by emile on 16/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
@testable import WeatherApp

class StringTests: XCTestCase {

    func testToDate() {
		
		let stringCorrect = "2019-05-25"
		let stringWrong = "2019-05-205"
		
		XCTAssertNotNil(stringCorrect.toDate())
		XCTAssertNil(stringWrong.toDate())
		XCTAssertNil(stringCorrect.toDate(withFormat: "gjhgj"))
    }
}
