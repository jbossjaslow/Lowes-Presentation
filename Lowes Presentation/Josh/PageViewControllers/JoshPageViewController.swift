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

        // Do any additional setup after loading the view.
		let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
		appearance.pageIndicatorTintColor = .red
		appearance.currentPageIndicatorTintColor = .blue
    }
	
	override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
		super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

}
