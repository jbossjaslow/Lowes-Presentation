//
//  MainMenuCoordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class MainMenuCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
	weak var parentCoordinator: Coordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	var viewModel: MainMenuViewModel?
	
	required init(navigationController: UINavigationController, parentCoordinator: Coordinator?) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
	}
	
	func start() {
		navigationController.delegate = self
		let vc = MainMenuViewController.instantiate()
		let vm = MainMenuViewModel(viewController: vc,
								   coordinator: self)
		vc.viewModel = vm
		self.viewModel = vm
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	func addShadow(for buttons: UIButton...) {
		guard let vm = viewModel else { return }
		
		buttons.forEach {
			vm.addShadow(for: $0)
		} //Cannot pass array of type '[UIButton]' as variadic arguments of type 'UIButton' --> Unfortunately can't pass 1 variadic function into another
		
	}
	
	func showJoshPages() {
		let child = PageViewControllerCoordinator(navigationController: navigationController,
												  parentCoordinator: self)
		childCoordinators.append(child)
		child.start()
	}
    
    func showJasminePages() {
		let child = JasminePageViewControllerCoordinator(navigationController: navigationController, parentCoordinator: self)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
	
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
			return
		}
		
		if navigationController.viewControllers.contains(fromViewController) {
			return
		}
	}
}
