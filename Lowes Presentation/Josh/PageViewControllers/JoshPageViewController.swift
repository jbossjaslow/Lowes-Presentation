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
		
		self.view.backgroundColor = .systemPink
//		for view in self.view.subviews {
//			if view.isKind(of:UIScrollView.self) {
//				view.frame = UIScreen.main.bounds
//			} else if view.isKind(of:UIPageControl.self) {
//				view.backgroundColor = UIColor.clear
//			}
//		}

//		guard let vm = viewModel else { return }
//		pageControl = UIPageControl(frame: .init(x: 0, y: 300, width: 100, height: 50))
//		pageControl.numberOfPages = vm.pages.count
//		pageControl.currentPage = 0
//		pageControl.tintColor = .white
//		pageControl.currentPageIndicatorTintColor = .white
//		pageControl.pageIndicatorTintColor = .black
//		view.addSubview(pageControl)
    }

}
