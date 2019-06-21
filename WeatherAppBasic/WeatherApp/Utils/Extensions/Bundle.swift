//
//  Bundle.swift
//  WeatherAppTests
//
//  Created by emile on 20/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

extension Bundle {
	
	var displayName: String {
		return object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
	}
	
	var version: String {
		return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
	}
}
