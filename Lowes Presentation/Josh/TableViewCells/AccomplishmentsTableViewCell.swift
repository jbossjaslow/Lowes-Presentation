//
//  AccomplishmentsTableViewCell.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/19/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class AccomplishmentsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var accomplishmentLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
