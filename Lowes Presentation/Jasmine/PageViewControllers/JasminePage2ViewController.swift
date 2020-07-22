//
//  Page2ViewController.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit
import SwiftUI

class JasminePage2ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var label: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.89, green: 0.87, blue: 0.85, alpha: 1.00)
        updateUI()
    }
    
    @objc func updateUI() {
        
        let bullet = "★  "
        var strings = [String]()
        strings.append("Add to Cart Button UI")
        strings.append("Customize Button UI")
        strings.append("UI Testing")
        strings.append("Data Analytics for Collection user interaction")
        strings.append("Unit Testing")
        strings = strings.map { return bullet + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.darkGray
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n\n")
        label.attributedText = NSAttributedString(string: string, attributes: attributes)
    }
}
