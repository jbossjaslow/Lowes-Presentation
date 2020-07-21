//
//  JasminePageViewModel.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class JasminePageViewModel: NSObject {
    weak var pageViewController: JasminePageViewController?
    var pageControl = UIPageControl()
    var infiniteSwipe: Bool = true
    
    lazy var pages: [UIViewController] = {
        return [
            JasminePage1ViewController.instantiate(),
            JasminePage2ViewController.instantiate()
        ]
    }()
    
    init(pageViewController: JasminePageViewController?) {
        super.init()
        guard let vc = pageViewController,
            let initialVC = pages.first else {
            fatalError("No view controllers!")
        }
        vc.setViewControllers([initialVC],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        self.pageViewController = pageViewController
    }
    
}
    
extension JasminePageViewModel {
    func formatPageControl() -> UIPageControl {
        guard let vc = pageViewController else { return UIPageControl() }
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

extension JasminePageViewModel: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
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
}
