//
//  JoshPageViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class JoshPageViewModel: NSObject {
	
	weak var viewController: JoshPageViewController?
	var pageControl = UIPageControl()
	
	var infiniteSwipe: Bool = true
	
	lazy var pages: [UIViewController] = {
		return [
			Page1ViewController.instantiate(),
			Page2ViewController.instantiate()
		]
	}()
	
	init(viewController: JoshPageViewController?) {
		super.init()
		guard let vc = viewController,
			let initialVC = pages.first else {
			fatalError("No view controllers set for page view controller")
		}
		vc.setViewControllers([initialVC],
							  direction: .forward,
							  animated: true,
							  completion: nil)
		self.viewController = viewController
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
			let position = pages.firstIndex(of: shownVC) else { return }
		pageControl.currentPage = position
	}
	
//	func presentationCount(for pageViewController: UIPageViewController) -> Int {
//		return pages.count
//	}
//
//	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//		return 0
//	}
}
