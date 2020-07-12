//
//  Coordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
	var parentCoordinator: Coordinator? { get set }
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	init(navigationController: UINavigationController,
		 parentCoordinator: Coordinator?)
	
	func start()
}

extension Coordinator {
	func childDidFinish(_ child: Coordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
			childCoordinators.remove(at: index)
			break
		}
	}
	
	func finish(completion: (() -> Void)? = nil) {
		self.navigationController.dismiss(animated: true, completion: completion)
	}
}
