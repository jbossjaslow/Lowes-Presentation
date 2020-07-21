//
//  Page1ViewController.swift
//  Lowes Presentation
//
//  Created by Jasmine Reyes on 7/18/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit
import SwiftUI

class JasminePage1ViewController: UIViewController, Storyboarded {
    var colorArray = [UIColor.red, UIColor.green, UIColor.yellow]
    var colorIndex = 1
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBAction func changeButtonTapped(_ sender: Any) {
        if colorIndex == 3 {
            colorIndex = 0
        }
        emojiLabel.textColor = colorArray[colorIndex]
        colorIndex += 1
    }
    @IBAction func myButtonTapped(_ sender: Any) {
        if emojiLabel.isHidden {
            emojiLabel.isHidden = false
        }
        else {
            emojiLabel.isHidden = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.89, green: 0.87, blue: 0.85, alpha: 1.00)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
