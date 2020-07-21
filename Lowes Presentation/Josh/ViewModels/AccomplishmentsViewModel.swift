//
//  AccomplishmentsViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/19/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class AccomplishmentsViewModel: NSObject {
	var coordinator: AccomplishmentsCoordinator?
	
	var accomplishments: Accomplishments?
	var currentAccomplishments: [String]?
	
	init(coordinator: AccomplishmentsCoordinator?) {
		super.init()
		
		self.coordinator = coordinator
		openJSON()
	}
	
	func openJSON() {
		do {
			if let url = Bundle.main.url(forResource: "Accomplishments",
										  withExtension: "json") {
				let jsonData = try Data(contentsOf: url)
				accomplishments = try JSONDecoder().decode(Accomplishments.self,
													 from: jsonData)
				currentAccomplishments = accomplishments?.GCP
//				accomplishments?.GCP.forEach{ print($0) }
			} else {
				return
			}
		} catch {
			print(error)
		}
	}
}

extension AccomplishmentsViewModel: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currentAccomplishments?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let currAcc = currentAccomplishments else { return UITableViewCell() }
		let cell = tableView.dequeueReusableCell(withIdentifier: "Bullet Cell", for: indexPath) as! AccomplishmentsTableViewCell
		
		cell.accomplishmentLabel.text = currAcc[indexPath.row]
		
		return cell
	}
}

extension AccomplishmentsViewModel {
	func toggleAccomplishmentType(segment: Int) {
		guard let accomplishmentArr = accomplishments else { return }
		if currentAccomplishments == accomplishmentArr.GCP {
			currentAccomplishments = accomplishmentArr.defects
		} else {
			currentAccomplishments = accomplishmentArr.GCP
		}
	}
}
