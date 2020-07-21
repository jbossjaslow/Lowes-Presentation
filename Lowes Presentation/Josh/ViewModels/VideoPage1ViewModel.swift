//
//  VideoPage1ViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/10/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import AVKit

class VideoPage1ViewModel: NSObject {
	weak var coordinator: VideoPage1Coordinator?
	weak var viewController: VideoPage1ViewController?
	var url: URL?
	
	init(viewController: VideoPage1ViewController?, coordinator: VideoPage1Coordinator) {
		super.init()
		self.coordinator = coordinator
		guard let vc = viewController else {
			fatalError("Failed to initialize a viewcontroller for this viewmodel")
		}
		self.viewController = vc
		
		guard let url = Bundle.main.url(forResource: "Curbside Pickup - Final Presentation",
										withExtension: "mov") else {
											fatalError("Can't find video file")
		}
		self.url = url
		vc.showVideo(url: url)
	}
}

extension VideoPage1ViewModel: AVPlayerViewControllerDelegate {
	
}
