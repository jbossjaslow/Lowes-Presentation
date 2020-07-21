//
//  VideoPage2ViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/20/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit
import AVKit

class VideoPage2ViewController: AVPlayerViewController, Storyboarded {
    weak var coordinator: VideoPage2Coordinator?
	var viewModel: VideoPage2ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	func showVideo(url: URL) {
		player = AVPlayer(url: url)
		player?.play()
	}
}
