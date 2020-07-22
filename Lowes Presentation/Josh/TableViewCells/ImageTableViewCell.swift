//
//  ImageTableViewCell.swift
//  Lowes Presentation
//
//  Created by Josh Jaslow on 7/22/20.
//  Copyright © 2020 Josh Jaslow. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageAccomplishView: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
