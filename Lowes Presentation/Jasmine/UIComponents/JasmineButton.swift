//
//  JasmineButton.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/21/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

public class JasmineButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.cornerRadius = 4.0
        self.applyGradient(colors: [UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor, UIColor(red: 0.97, green: 0.73, blue: 0.59, alpha: 1.00).cgColor])
        self.layer.borderColor = UIColor.black.cgColor
    }
}

extension UIButton {
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
