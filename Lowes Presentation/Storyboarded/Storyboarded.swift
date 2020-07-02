//
//  Storyboarded.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 6/29/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

protocol Storyboarded {
	static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
	//Allows us to create VCs in a storyboard with the same storyboard ID as the class name
	static func instantiate() -> Self {
		let id = String(describing: self)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		return storyboard.instantiateViewController(identifier: id) as! Self
	}
}
