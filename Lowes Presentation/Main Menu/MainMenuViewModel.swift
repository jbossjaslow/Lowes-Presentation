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
	
	func addShadow(for button: UIButton) {
		button.layer.shadowColor = UIColor.lightGray.cgColor
		button.layer.shadowOpacity = 1
		button.layer.shadowOffset = .init(width: 0, height: 4)
		button.layer.shadowRadius = 1
	}
}
