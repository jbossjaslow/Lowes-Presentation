//
//  Page2ViewController.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/4/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class AccomplishmentsViewController: UIViewController, Storyboarded {
	weak var coordinator: AccomplishmentsCoordinator?
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var containerViewTableView: UIView!
	@IBOutlet weak var accomplishmentSegmentedControl: UISegmentedControl!
	@IBOutlet weak var containerViewSegmentedControl: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		guard let coord = coordinator else { return }
		self.tableView.delegate = coord.viewModel
		self.tableView.dataSource = coord.viewModel
		
		addShadow(containerViewTableView)
		
		tableView.layer.cornerRadius = 10
		tableView.layer.masksToBounds = true
		
		addShadow(containerViewSegmentedControl)
		containerViewSegmentedControl.layer.cornerRadius = accomplishmentSegmentedControl.layer.cornerRadius
    }
	
	func addShadow(_ view: UIView) {
		view.layer.shadowColor = UIColor.lightGray.cgColor
		view.layer.shadowOpacity = 1
		view.layer.shadowOffset = .init(width: 0, height: 4)
		view.layer.shadowRadius = 1
	}

	@IBAction func accomplishmentValueChanged(_ sender: UISegmentedControl) {
		coordinator?.changeAccomplishmentType(segment: sender.selectedSegmentIndex)
		tableView.reloadData()
	}
}
