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
	var pageControl: UIPageControl?

    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let parent = coordinator?.parentCoordinator else { return }
		self.view.bounds = parent.navigationController.view.bounds
		
		self.view.backgroundColor = UIColor(named: "Background")
		
		guard let vm = viewModel else { return }
		let pc = vm.formatPageControl()
		addSubview(pc)
//		pc.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
//		pc.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//		pc.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		pageControl = pc
//		edgesForExtendedLayout.remove(.top)
    }

}

extension JoshPageViewController {
	func addSubview(_ view: UIView) {
		self.view.addSubview(view)
	}
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
