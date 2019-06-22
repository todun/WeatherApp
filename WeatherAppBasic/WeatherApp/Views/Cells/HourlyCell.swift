//
//  HourlyCell.swift
//  WeatherApp
//
//  Created by emile on 21/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class HourlyCell: UICollectionViewCell {
	
	static let identifier = "HourlyCell"
	
	private let timeLabel = UILabel()
	private let timeAnnotationLabel = UILabel()
	private let weatherIcon = UIImageView()
	private let temperatureLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configurable
extension HourlyCell: ConfigurableCell {
	
	func configure(data forecast: Forecast) {
		timeLabel.text = forecast.date.toString(withFormat: "hh")
		timeAnnotationLabel.text = forecast.date.toString(withFormat: "a")
		weatherIcon.image = UIImage(named: forecast.weather?.icon ?? "")
		temperatureLabel.text = "\(Int(forecast.temperature.mid)/10)°"
	}
}

// MARK: - Setup UI
extension  HourlyCell {
	
	fileprivate func setupView() {
		
		// Container
		let container = UIStackView()
		container.axis = .vertical
		container.alignment = .center
		container.distribution = .fill
		addSubview(container)
		container.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
		
		let timeContainer = UIStackView()
		timeContainer.axis = .horizontal
		timeContainer.alignment = .firstBaseline
		timeContainer.distribution = .fillEqually
		timeContainer.isBaselineRelativeArrangement = true
		container.addArrangedSubview(timeContainer)
		timeContainer.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
		
		// Time label
		timeLabel.text = Date().toString(withFormat: "hh")
		timeLabel.textAlignment = .right
		timeLabel.textColor = UIColor.darkGray
		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
		timeContainer.addArrangedSubview(timeLabel)
		//timeLabel.anchor(height: 20)
		
		// Time AM/PM label
		timeAnnotationLabel.text = Date().toString(withFormat: "a")
		timeAnnotationLabel.textAlignment = .left
		timeAnnotationLabel.textColor = UIColor.darkGray
		timeAnnotationLabel.translatesAutoresizingMaskIntoConstraints = false
		timeAnnotationLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
		timeContainer.addArrangedSubview(timeAnnotationLabel)
		//timeAnnotationLabel.anchor(height: 20)
		
		// Weather icon
		weatherIcon.image = UIImage(named: "01n")
		weatherIcon.tintColor = .darkGray
		weatherIcon.contentMode = UIView.ContentMode.scaleAspectFit
		container.addArrangedSubview(weatherIcon)
		weatherIcon.anchor(width: 30)
		
		// temperatureLabel
		temperatureLabel.text = "23°"
		temperatureLabel.textAlignment = .center
		temperatureLabel.textColor = UIColor.darkGray
		temperatureLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
		container.addArrangedSubview(temperatureLabel)
		temperatureLabel.anchor(left: leftAnchor, right: rightAnchor, height: 26)
	}
}
