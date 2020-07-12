//
//  VideoPage1Coordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/12/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class VideoPage1Coordinator: NSObject, Coordinator {
	weak var parentCoordinator: Coordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	var shownVC: VideoPage1ViewController
	
	required init(navigationController: UINavigationController,
		 parentCoordinator: Coordinator?) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
		shownVC = VideoPage1ViewController()
	}
	
	func start() {
		shownVC = VideoPage1ViewController.instantiate()
		let vm = VideoPage1ViewModel(viewController: shownVC,
									 coordinator: self)
		shownVC.viewModel = vm
	}
	
	
}
