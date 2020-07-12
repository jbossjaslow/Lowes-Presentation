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
	
	required init(navigationController: UINavigationController,
		 parentCoordinator: Coordinator?) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
	}
	
	func start() {
//		navigationController.delegate = self
		let pages = [
			showVideoPage1(),
			Page2ViewController.instantiate()
		]
		
		let vc = JoshPageViewController.instantiate()
		let vm = JoshPageViewModel(viewController: vc,
								   pages: pages,
								   coordinator: self)
		vc.coordinator = self
		vc.dataSource = vm
		vc.delegate = vm
		vc.viewModel = vm
		
		navigationController.pushViewController(vc, animated: true)
	}
	
	func showVideoPage1() -> UIViewController {
		let child = VideoPage1Coordinator(navigationController: navigationController,
										  parentCoordinator: self)
		childCoordinators.append(child)
		child.start()
		return child.shownVC
	}
}
