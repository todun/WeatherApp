//
//  CityMapView.swift
//  WeatherApp
//
//  Created by emile on 22/06/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit
import MapKit

class CityMapView: MKMapView {

	convenience init(parent view: UIView) {
		
		self.init()
		
		isHidden = true
		mapType = .standard
		isZoomEnabled = false
		isPitchEnabled = false
		isRotateEnabled = false
		isScrollEnabled = false
		
		view.addSubview(self)
		anchor(top: view.topAnchor,
			   left: view.leftAnchor,
			   right: view.rightAnchor,
			   height: 250)
	}
}
