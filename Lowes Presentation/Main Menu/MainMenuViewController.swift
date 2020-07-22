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
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var pickYourInternLabel: UILabel!
	
	weak var coordinator: MainMenuCoordinator?
	var viewModel: MainMenuViewModel?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		addShadows()
//		logo.layer.zPosition = -1
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		coordinator?.navigationController.setNavigationBarHidden(true, animated: animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		coordinator?.navigationController.setNavigationBarHidden(false, animated: animated)
	}
	
	func addShadows() {
		guard let coord = coordinator else { return }
		
		coord.addShadow(for: JoshButton, JasmineButton, logo, titleLabel, pickYourInternLabel)
	}

	@IBAction func testButton(_ sender: UIButton) {
		guard let buttonText = sender.titleLabel?.text else {
			return
		}
		switch buttonText {
		case "Josh":
			coordinator?.showJoshPages()
		case "Jasmine":
            coordinator?.showJasminePages()
		default:
			print("Button has no text")
		}
	}
	
}

