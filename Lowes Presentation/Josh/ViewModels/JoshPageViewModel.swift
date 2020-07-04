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
	var infiniteSwipe: Bool = true
	
	lazy var pages: [UIViewController] = {
		return [
			Page1ViewController.instantiate(),
			Page2ViewController.instantiate()
		]
	}()
	
	init(viewController: JoshPageViewController?) {
		super.init()
		guard let vc = viewController, let initialVC = pages.first else {
			fatalError("No view controllers set for page view controller")
		}
		vc.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
		self.viewController = viewController
	}
}

extension JoshPageViewModel: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
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
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
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
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return pages.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return 0
	}
}
