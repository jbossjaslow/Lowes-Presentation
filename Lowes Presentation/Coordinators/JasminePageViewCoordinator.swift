//
//  JasminePageViewCoordinator.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class JasminePageViewControllerCoordinator: NSObject, Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        navigationController.delegate = self
        let jasmineVC = JasminePageViewController.instantiate()
        let vm = JasminePageViewModel(pageViewController: jasmineVC)
        jasmineVC.coordinator = self
        jasmineVC.dataSource = vm
        jasmineVC.delegate = vm
        jasmineVC.jasminePageViewModel = vm
        
        navigationController.pushViewController(jasmineVC, animated: true)
    }
}
