//
//  MainMenuViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class MainMenuViewModel: NSObject {
	weak var coordinator: MainMenuCoordinator?
	weak var viewController: MainMenuViewController?
	
	init(viewController: MainMenuViewController?, coordinator: MainMenuCoordinator?) {
		self.viewController = viewController
		self.coordinator = coordinator
	}
	
	func addShadow(for view: UIView) {
		view.layer.shadowColor = UIColor.lightGray.cgColor
		view.layer.shadowOpacity = 1
		view.layer.shadowOffset = .init(width: 0, height: 4)
		view.layer.shadowRadius = 1
	}
}
