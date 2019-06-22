//
//  CityTableView.swift
//  WeatherApp
//
//  Created by emile on 22/06/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class CityTableView: UITableView {

	
}

extension UITableView {
	
	convenience init(parent view: UIView) {
		
		self.init()
		
		// Register Cells
		register(CurrentCell.self, forCellReuseIdentifier: CurrentCell.identifier)
		register(DailyCell.self, forCellReuseIdentifier: DailyCell.identifier)
		
		// Misc Properties
		separatorStyle = .singleLine
		contentInsetAdjustmentBehavior = .automatic
		
		// Row Height
		rowHeight = UITableView.automaticDimension
		estimatedRowHeight = 10
		
		view.addSubview(self)
		anchor(top: view.topAnchor,
			   paddingTop: 250,
			   bottom: view.bottomAnchor,
			   left: view.leftAnchor,
			   right: view.rightAnchor)
	}
}
