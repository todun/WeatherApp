//
//  HourlyController.swift
//  WeatherApp
//
//  Created by emile on 20/04/2019.
//  Copyright © 2019 emile. All rights reserved.
//

import UIKit

class HourlyController: UICollectionViewController {

	var items: [Forecast]? {
		didSet {
			collectionView.reloadData()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
}

// MARK: - Setup UI
extension HourlyController {
	
	fileprivate func setupView() {
		
		// Layout
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
		
		// Register Cells
		self.collectionView!.register(HourlyCell.self, forCellWithReuseIdentifier: HourlyCell.identifier)
		
		// Misc Properties
		collectionView.backgroundColor = .clear
		collectionView.collectionViewLayout = layout
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = true
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HourlyController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 60, height: collectionView.frame.size.height)
	}
}

// MARK: - UICollectionViewDataSource
extension HourlyController {

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items?.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let item = items?[indexPath.row] else {
			return UICollectionViewCell()
		}
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCell.identifier, for: indexPath)
			
		
		if let cell = cell as? HourlyCell {
			cell.configure(data: item)
		}
		
		return cell
	}
}

// MARK: - UICollectionViewDelegate
extension HourlyController {
	
	/*	
	override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
	
	}
	*/
}
