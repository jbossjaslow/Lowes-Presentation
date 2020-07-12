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
	
	var viewModel: VideoPage1ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	func showVideo(url: URL) {
		player = AVPlayer(url: url)
		player?.play()
	}

}
