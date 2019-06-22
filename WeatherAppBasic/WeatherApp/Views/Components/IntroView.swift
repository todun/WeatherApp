//
//  IntroView.swift
//  WeatherApp
//
//  Created by emile on 21/06/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class IntroView: UIView {

	private let imageView = UIImageView(image: UIImage(named: "weatherAppLaunch"))
	//private let indicator = UIActivityi
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - Setup UI
extension  IntroView {
	
	fileprivate func setupView() {
		
		backgroundColor = .white
		
		addSubview(imageView)
		imageView.anchor(width: 180, height: 180)
		self.addConstraint(NSLayoutConstraint(item: imageView,
											  attribute: NSLayoutConstraint.Attribute.centerX,
											  relatedBy: NSLayoutConstraint.Relation.equal,
											  toItem: self,
											  attribute: NSLayoutConstraint.Attribute.centerX,
											  multiplier: 1.0,
											  constant: 0.0))
		
		self.addConstraint(NSLayoutConstraint(item: imageView,
											  attribute: NSLayoutConstraint.Attribute.centerY,
											  relatedBy: NSLayoutConstraint.Relation.equal,
											  toItem: self,
											  attribute: NSLayoutConstraint.Attribute.centerY,
											  multiplier: 1.0,
											  constant: 0.0))
	}
}
