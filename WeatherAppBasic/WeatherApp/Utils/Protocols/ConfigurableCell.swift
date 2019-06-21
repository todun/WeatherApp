//
//  ConfigurableCell.swift
//  WeatherApp
//
//  Created by emile on 20/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
	associatedtype DataType
	func configure(data: DataType)
}
