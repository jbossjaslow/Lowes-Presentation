//
//  ViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, Storyboarded {
	weak var coordinator: MainMenuCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func testButton(_ sender: UIButton) {
		guard let buttonText = sender.titleLabel?.text else {
			return
		}
		switch buttonText {
		case "Josh":
			coordinator?.showJoshPages()
		case "Jasmine":
			print(buttonText)
		default:
			print("Button has no text")
		}
	}
	
}

