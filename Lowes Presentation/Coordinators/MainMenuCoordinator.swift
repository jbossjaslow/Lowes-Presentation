//
//  MainMenuCoordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class MainMenuCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		navigationController.delegate = self
		let vc = MainMenuViewController.instantiate()
		vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	func childDidFinish(_ child: Coordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
	
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
			return
		}
		
		if navigationController.viewControllers.contains(fromViewController) {
			return
		}
		
//		if let buyViewController = fromViewController as? BuyViewController {
//			childDidFinish(buyViewController.coordinator)
//		}
	}
}
