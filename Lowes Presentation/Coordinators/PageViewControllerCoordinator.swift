//
//  PageViewControllerCoordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class PageViewControllerCoordinator: NSObject, Coordinator {
	weak var parentCoordinator: Coordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
//		navigationController.delegate = self
		let vc = JoshPageViewController.instantiate()
		let vm = JoshPageViewModel(viewController: vc)
		vc.coordinator = self
		vc.dataSource = vm
		vc.delegate = vm
		vc.viewModel = vm
		
		navigationController.pushViewController(vc, animated: true)
	}
}
