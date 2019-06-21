//
//  CurrentCell.swift
//  WeatherApp
//
//  Created by emile on 20/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class CurrentCell: UITableViewCell {
	
	static let identifier = "CurrentCell"

	let titleLabel = UILabel()
	let iconImage = UIImageView()
	let detailLabel = UILabel()
	let subtitleLabel = UILabel()
	let bottomContainer = HourlyController(collectionViewLayout: UICollectionViewFlowLayout())
	
	weak var containerController: CityController? {
		didSet {
			setupView()
		}
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configurable
extension CurrentCell: ConfigurableCell {
	
	func configure(data city: City) {
		
		titleLabel.text = city.name
		
		if let forecast = city.next24hours.first {
			
			iconImage.image = UIImage(named: forecast.weather?.icon ?? "")
			detailLabel.text = "\(Int(forecast.temperature.mid)/10)°"

			var condition = ""
			let midTemp = "It's currently \(Int(forecast.temperature.mid)/10)°;"
			let maxTemp = "the high will be \(Int(forecast.temperature.max)/10)°."
			let wind = "With \(forecast.wind.toString) wind."
			
			if let weather = forecast.weather {
				condition = "\(weather.description).".capitalizingFirstLetter()
			}
			
			subtitleLabel.text = "Today: \(condition) \(midTemp) \(maxTemp) \(wind)"
			
			bottomContainer.items = city.next24hours
		}
	}
}

// MARK: - Setup UI
extension CurrentCell {
	
	fileprivate func setupView() {
		
		// Clean view
		subviews.forEach { $0.removeFromSuperview() }
		
		// Cell properties
		self.selectionStyle = .none
		self.backgroundColor = defaultTintColor
		
		// Container
		let container = UIStackView()
		container.spacing = 10
		container.axis = .vertical
		container.distribution = .fill
		addSubview(container)
		container.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
		
		// Separator Top
		let separatorTop = UIView()
		separatorTop.backgroundColor = defaultTintDarkColor
		container.addArrangedSubview(separatorTop)
		separatorTop.anchor(height: 1)
		
		// Top container
		let topContainer = UIStackView()
		topContainer.spacing = 5
		topContainer.axis = .vertical
		topContainer.distribution = .fill
		topContainer.isLayoutMarginsRelativeArrangement = true
		topContainer.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 15)
		container.addArrangedSubview(topContainer)
		
		// Top container
		let cityContainer = UIStackView()
		cityContainer.spacing = 15
		cityContainer.axis = .horizontal
		cityContainer.distribution = .fill
		topContainer.addArrangedSubview(cityContainer)
		
		// Title label
		titleLabel.text = "Title Label"
		titleLabel.textAlignment = .left
		titleLabel.textColor = UIColor.darkGray
		titleLabel.font = UIFont.systemFont(ofSize: 48, weight: UIFont.Weight.light)
		cityContainer.addArrangedSubview(titleLabel)
		
		// Weather icon
		iconImage.image = UIImage(named: "01d")
		iconImage.tintColor = .darkGray
		iconImage.contentMode = UIView.ContentMode.scaleAspectFit
		cityContainer.addArrangedSubview(iconImage)
		iconImage.anchor(width: 30, height: 44)
		
		// Detail Label
		detailLabel.text = "Detail Label"
		detailLabel.textAlignment = .right
		detailLabel.textColor = UIColor.darkGray
		detailLabel.font = UIFont.systemFont(ofSize: 48, weight: UIFont.Weight.light)
		cityContainer.addArrangedSubview(detailLabel)
		detailLabel.anchor(width: 80)
		
		// Separator
		let separator = UIView()
		separator.backgroundColor = defaultTintDarkColor
		topContainer.addArrangedSubview(separator)
		separator.anchor(height: 1)
		
		// Subtitle label
		subtitleLabel.text = "Subtitle Label"
		subtitleLabel.textAlignment = .left
		subtitleLabel.numberOfLines = 0
		subtitleLabel.textColor = UIColor.darkGray
		subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
		topContainer.addArrangedSubview(subtitleLabel)
		
		// Separator Mid
		let separatorMid = UIView()
		separatorMid.backgroundColor = defaultTintDarkColor
		topContainer.addArrangedSubview(separatorMid)
		separatorMid.anchor(height: 1)
		
		// Bottom container
		containerController?.addChild(bottomContainer)
		container.addArrangedSubview(bottomContainer.collectionView)
		bottomContainer.didMove(toParent: containerController)
		
		// Separator Top
		let separatorBottom = UIView()
		separatorBottom.backgroundColor = defaultTintDarkColor
		container.addArrangedSubview(separatorBottom)
		separatorBottom.anchor(height: 1)
	}
}
