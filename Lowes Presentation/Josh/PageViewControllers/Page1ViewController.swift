//
//  Page1ViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit
import AVKit

class VideoPage1ViewController: AVPlayerViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension VideoPage1ViewController: AVPlayerViewControllerDelegate {
	
}
