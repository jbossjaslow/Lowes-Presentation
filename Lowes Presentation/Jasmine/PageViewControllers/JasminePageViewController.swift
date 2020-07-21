//
//  JasmineViewController.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit
import SwiftUI

class JasminePageViewController: UIPageViewController, Storyboarded {
    var jasminePageViewModel: JasminePageViewModel?
    weak var coordinator: JasminePageViewControllerCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vm = jasminePageViewModel else { return }
        addSubview(vm.formatPageControl())
    }
}

extension JasminePageViewController {
    func addSubview(_ view: UIView) {
        self.view.addSubview(view)
    }
    
}
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

