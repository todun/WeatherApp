//
//  DailyCell.swift
//  WeatherApp
//
//  Created by emile on 18/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {
	
	static let identifier = "DailyCell"
	
	private let dayLabel = UILabel()
	private let dateLabel = UILabel()
	private let weatherIcon = UIImageView()
	private var maxLabel = UILabel()
	private var minLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configurable
extension DailyCell: ConfigurableCell {
	
	func configure(data: Array<Forecast>.DatedItem) {
		
		let arr = data.items.compactMap { $0.temperature }

		dayLabel.text = data.date.toString(withFormat: "EEE")
		dateLabel.text = data.date.toString(withFormat: "dd MMM yyyy").uppercased()
		weatherIcon.image = UIImage(named: data.items.first?.weather?.icon ?? "")
		maxLabel.text = arr.temperatureMax.string
		minLabel.text = arr.temperatureMin.string
	}
}

// MARK: - Setup UI
extension  DailyCell {
	
	fileprivate func setupView() {
	
		// Cell properties
		self.selectionStyle = .none
		
		// Container
		let container = UIStackView()
		container.spacing = 10
		container.axis = .horizontal
		container.distribution = .fill
		container.alignment = .lastBaseline
		container.isBaselineRelativeArrangement = true
		container.isLayoutMarginsRelativeArrangement = true
		container.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 15)
		addSubview(container)
		container.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor,  right: rightAnchor)

		// Day label
		dayLabel.text = "Day"
		dayLabel.textAlignment = .left
		dayLabel.textColor = .darkGray
		dayLabel.font = .systemFont(ofSize: 42, weight: UIFont.Weight.light)
		container.addArrangedSubview(dayLabel)
		dayLabel.anchor(width: 100)
		
		// Date label
		dateLabel.text = "20 DEC 2019"
		dateLabel.textAlignment = .left
		dateLabel.textColor = .lightGray
		dateLabel.font = .systemFont(ofSize: 14, weight: UIFont.Weight.regular)
		container.addArrangedSubview(dateLabel)
		
		// Weather icon
		weatherIcon.image = UIImage(named: "01d")
		weatherIcon.contentMode = UIView.ContentMode.scaleAspectFit
		container.addArrangedSubview(weatherIcon)
		weatherIcon.anchor(width: 30, height: 30)
		
		// Temperature container
		let temperatureContainer = UIStackView()
		temperatureContainer.spacing = 5
		temperatureContainer.alignment = .firstBaseline
		temperatureContainer.isBaselineRelativeArrangement = true
		container.addArrangedSubview(temperatureContainer)
		
		// Max temperature label
		maxLabel.text = "32°"
		maxLabel.textAlignment = .right
		maxLabel.textColor = .darkGray
		maxLabel.font = .systemFont(ofSize: 42, weight: UIFont.Weight.light)
		temperatureContainer.addArrangedSubview(maxLabel)
		
		// Min temperature label
		minLabel.text = "23°"
		minLabel.textAlignment = .right
		minLabel.textColor = .lightGray
		minLabel.adjustsFontSizeToFitWidth = true
		minLabel.font = .systemFont(ofSize: 24, weight: UIFont.Weight.light)
		temperatureContainer.addArrangedSubview(minLabel)
	}
}
