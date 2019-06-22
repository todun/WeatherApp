//
//  CityController.swift
//  WeatherApp
//
//  Created by emile on 11/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit
import MapKit

class CityController: UIViewController {
	
	enum TableSections: Int {
		
		case current, daily
		
		var identifier: String  {
			switch self {
			case .current: return CurrentCell.identifier
			case .daily: return DailyCell.identifier
			}
		}
		
		static var items: [TableSections] {
			return [.current, .daily]
		}
		
		static var count: Int {
			return items.count
		}
	}
	
	let tableView = UITableView()
	let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
	
	var city: City?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadData()
	}
}

// MARK: - Helpers
extension CityController {
	
	fileprivate func loadData() {
		NetworkManager.shared.getWeather { city, _ in
			if let city = city {
				self.city = city
				self.updateTableView()
			}
		}
	}
	
	fileprivate func setupView() {

		// Title
		title = "\(Bundle.main.displayName) \(Bundle.main.version)"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationItem.largeTitleDisplayMode = .automatic

		// Register Delegates
		tableView.delegate = self
		tableView.dataSource = self
		
		// Register Cells
		tableView.register(CurrentCell.self, forCellReuseIdentifier: CurrentCell.identifier)
		tableView.register(DailyCell.self, forCellReuseIdentifier: DailyCell.identifier)
		
		// Misc Properties
		tableView.separatorStyle = .singleLine
		tableView.contentInsetAdjustmentBehavior = .automatic
		
		// TableView Header
		//tableView.tableHeaderView = mapView
		
		// Row Height
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 10
		
		// Add TableView
		view.addSubview(tableView)
		tableView.anchor(top: view.topAnchor,
						 paddingTop: 250,
						 bottom: view.bottomAnchor,
						 left: view.leftAnchor,
						 right: view.rightAnchor)
		
		// MapView
		mapView.isHidden = true
		mapView.mapType = .standard
		mapView.isZoomEnabled = false
		mapView.isPitchEnabled = false
		mapView.isRotateEnabled = false
		mapView.isScrollEnabled = false
		
		view.addSubview(mapView)
		mapView.anchor(top: view.topAnchor,
					   left: view.leftAnchor,
					   right: view.rightAnchor,
					   height: 250)
	}
	
	fileprivate func updateTableView() {
		DispatchQueue.main.async {
			if let city = self.city {
				let region = MKCoordinateRegion(center: city.location,
												latitudinalMeters: 4000,
												longitudinalMeters: 4000)
				self.mapView.isHidden = false
				self.mapView.setRegion(region, animated: true)
				self.tableView.reloadData()
			}
		}
	}
}

// MARK: - UITableViewDataSource
extension CityController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		guard let _ = city else {
			return 0
		}
		return TableSections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let city = city {
			switch TableSections(rawValue: section) {
			case .current?: return 1
			case .daily?: return city.forecasts.count
			default: return 0
			}
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let city = city else {
			return UITableViewCell()
		}
		
		let identifier = TableSections(rawValue: indexPath.section)?.identifier ?? ""

		if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) {
			
			if let cell = cell as? CurrentCell {
				cell.containerController = self
				cell.configure(data: city)
			} else if let cell = cell as? DailyCell {
				cell.configure(data: city.forecasts[indexPath.row])
			}
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
extension CityController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch TableSections(rawValue: indexPath.section) {
		case .current?: return 200
		case .daily?: return 54
		default:return 0
		}
	}
}

