//
//  JSONParameterEncoderTest.swift
//  WeatherAppTests
//
//  Created by emile on 17/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import XCTest
@testable import WeatherApp

class JSONParameterEncoderTest: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testEncode() {
		
		guard let url = URL(string: "http://www.network.com/") else {
			XCTAssertTrue(false, "Could not instantiate url")
			return
		}
		
		var urlRequest = URLRequest(url: url)
		let parameters: Parameters = ["id": 1,
									  "name": "user",
									  "email": "user@network.com",
									  "isActive": true]
		
		let encoder = JSONParameterEncoder()
		try? encoder.encode(urlRequest: &urlRequest, with: parameters)
		
		guard let fullURL = urlRequest.url else {
			XCTAssertTrue(false, "urlRequest url is nil.")
			return
		}
		
		let expectedURL = "http://www.network.com/"
		XCTAssertEqual(fullURL.absoluteString.sorted(), expectedURL.sorted())
		
		guard let parametersNew = try? JSONSerialization.jsonObject(with: urlRequest.httpBody!, options: []) as! Parameters else {
			XCTAssertTrue(false, "urlRequest url is nil.")
			return
		}
		
		XCTAssertEqual(parameters["id"] as! Int, parametersNew["id"] as! Int)
		XCTAssertEqual(parameters["name"] as! String, parametersNew["name"] as! String)
		XCTAssertEqual(parameters["email"] as! String, parametersNew["email"] as! String)
		XCTAssertEqual(parameters["isActive"] as! Bool, parametersNew["isActive"] as! Bool)
    }
}
