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
		let bundle = Bundle(for: self)
		return Self.instantiate(bundle: bundle)
	}
	
	static func instantiate(for storyboardName: String) -> Self {
		let bundle = Bundle(for: self)
		return Self.instantiate(for: storyboardName, in: bundle)
	}
	
	static func instantiate(for storyboardName: String, in bundle: Bundle) -> Self {
		let fullName = NSStringFromClass(self)
		let className = fullName.components(separatedBy: ".")[1]
		
		let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
		
		guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
			fatalError("Unable to get viewcontroller from storyboard: \(className)")
		}
		
		return viewController
	}
	
	static func instantiate(bundle: Bundle) -> Self {
		let fullName = NSStringFromClass(self)
		let className = fullName.components(separatedBy: ".")[1]
		
		let storyboard = UIStoryboard(name: className, bundle: bundle)
		guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
			fatalError("Unable to get viewcontroller from storyboard: \(className)")
		}
		
		return viewController
	}
}
