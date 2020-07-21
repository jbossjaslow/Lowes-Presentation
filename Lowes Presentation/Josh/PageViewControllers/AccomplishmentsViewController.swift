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
	@IBOutlet weak var accomplishmentSegmentedControl: UISegmentedControl!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		guard let coord = coordinator else { return }
		self.tableView.delegate = coord.viewModel
		self.tableView.dataSource = coord.viewModel
		
		tableView.layer.cornerRadius = 10
    }

	@IBAction func accomplishmentValueChanged(_ sender: UISegmentedControl) {
		coordinator?.changeAccomplishmentType(segment: sender.selectedSegmentIndex)
		tableView.reloadData()
	}
}
