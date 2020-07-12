//
//  JoshPageViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class JoshPageViewModel: NSObject {
	weak var coordinator: PageViewControllerCoordinator?
	weak var viewController: JoshPageViewController?
	var pageControl = UIPageControl()
	
	var infiniteSwipe: Bool = true
	
	var pages: [UIViewController] = []
	
	init(viewController: JoshPageViewController?, pages: [UIViewController], coordinator: PageViewControllerCoordinator) {
		super.init()
		self.pages = pages
		guard let vc = viewController,
			let initialVC = pages.first else {
			fatalError("No view controllers set for page view controller")
		}
		vc.setViewControllers([initialVC],
							  direction: .forward,
							  animated: true,
							  completion: nil)
		self.viewController = viewController
		self.coordinator = coordinator
		vc.title = "Curbside Pickup"
	}
}

extension JoshPageViewModel {
	func formatPageControl() -> UIPageControl {
		guard let vc = viewController else { return UIPageControl() }
		let pc = UIPageControl(frame: .init(x: 0,
											y: vc.view.frame.maxY - 50,
											width: vc.view.frame.width,
											height: 50))
		pc.numberOfPages = pages.count
		pc.currentPage = 0
		pc.tintColor = .white
		pc.currentPageIndicatorTintColor = .white
		pc.pageIndicatorTintColor = .black
		pc.isUserInteractionEnabled = false
		pageControl = pc
		return pageControl
	}
}

extension JoshPageViewModel: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
	func pageViewController(_ pageViewController: UIPageViewController,
							viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = pages.firstIndex(of: viewController) else {
			return nil
		}
		
		switch index {
		case 0:
			return infiniteSwipe ? pages.last : nil
		default:
			return pages[index - 1]
		}
	}
	
	func pageViewController(_ pageViewController: UIPageViewController,
							viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = pages.firstIndex(of: viewController) else {
			return nil
		}
		
		switch index {
		case pages.count - 1:
			return infiniteSwipe ? pages.first : nil
		default:
			return pages[index + 1]
		}
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		guard let shownVC = pageViewController.viewControllers?[0],
			let position = pages.firstIndex(of: shownVC), let vc = viewController else { return }
		pageControl.currentPage = position
		switch position {
		case 0:
			vc.title = "Curbside Pickup"
		case 1:
			vc.title = "Hello World"
		default:
			vc.title = "This should not display"
		}
	}
}
