//
//  ViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, Storyboarded {
	
	@IBOutlet weak var JoshButton: UIButton!
	@IBOutlet weak var JasmineButton: UIButton!
	
	weak var coordinator: MainMenuCoordinator?
	var viewModel: MainMenuViewModel?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		addShadows()
	}
	
	func addShadows() {
		guard let coord = coordinator else { return }
		
		coord.addShadow(for: JoshButton, JasmineButton)
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

