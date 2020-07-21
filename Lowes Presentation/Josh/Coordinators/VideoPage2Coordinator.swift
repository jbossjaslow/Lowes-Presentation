//
//  VideoPage2Coordinator.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/20/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class VideoPage2Coordinator: NSObject, Coordinator {
	weak var parentCoordinator: Coordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	var shownVC: VideoPage2ViewController
	
	required init(navigationController: UINavigationController,
		 parentCoordinator: Coordinator?) {
		self.navigationController = navigationController
		self.parentCoordinator = parentCoordinator
		shownVC = VideoPage2ViewController.instantiate()
	}
	
	func start() {
		//shownVC = VideoPage1ViewController.instantiate()
		let vm = VideoPage2ViewModel(viewController: shownVC,
									 coordinator: self)
		shownVC.viewModel = vm
		shownVC.coordinator = self
	}
	
	
}
