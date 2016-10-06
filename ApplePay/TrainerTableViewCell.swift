//
//  TrainerTableViewCell.swift
//  ApplePay
//
//  Created by Kris Rajendren on Oct/6/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class TrainerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var trainerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
