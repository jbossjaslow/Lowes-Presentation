//
//  AccomplishmentsCoordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/19/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class AccomplishmentsCoordinator: NSObject, Coordinator {
	weak var parentCoordinator: Coordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	var viewModel: AccomplishmentsViewModel?
	var shownVC: AccomplishmentsViewController?
	
	required init(navigationController: UINavigationController,
		 parentCoordinator: Coordinator?) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
	}
	
	func start() {
		let vc = AccomplishmentsViewController.instantiate()
		vc.coordinator = self
		shownVC = vc
		viewModel = AccomplishmentsViewModel(coordinator: self)
	}
	
	func changeAccomplishmentType(segment: Int) {
		viewModel?.toggleAccomplishmentType(segment: segment)
	}
}
