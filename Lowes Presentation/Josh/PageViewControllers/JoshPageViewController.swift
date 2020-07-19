//
//  JoshPageViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class JoshPageViewController: UIPageViewController, Storyboarded {
	weak var coordinator: PageViewControllerCoordinator?
	var viewModel: JoshPageViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = UIColor(named: "Background")
		
		guard let vm = viewModel else { return }
		addSubview(vm.formatPageControl())
		edgesForExtendedLayout.remove(.top)
    }

}

extension JoshPageViewController {
	func addSubview(_ view: UIView) {
		self.view.addSubview(view)
	}
}
