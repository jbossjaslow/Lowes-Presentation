//
//  VideoPage2ViewModel.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/20/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import AVKit

class VideoPage2ViewModel: NSObject {
	weak var coordinator: VideoPage2Coordinator?
	weak var viewController: VideoPage2ViewController?
	var url: URL?
	
	init(viewController: VideoPage2ViewController?, coordinator: VideoPage2Coordinator) {
		super.init()
		self.coordinator = coordinator
		guard let vc = viewController else {
			fatalError("Failed to initialize a viewcontroller for this viewmodel")
		}
		self.viewController = vc
		
		guard let url = Bundle.main.url(forResource: "3022 - name, image and price",
										withExtension: "mov") else {
											fatalError("Can't find video file")
		}
		self.url = url
		vc.showVideo(url: url)
	}
}

extension VideoPage2ViewModel: AVPlayerViewControllerDelegate {
	
}
