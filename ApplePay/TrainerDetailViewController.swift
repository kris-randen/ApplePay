//
//  TrainerDetailViewController.swift
//  ApplePay
//
//  Created by Kris Rajendren on Oct/6/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class TrainerDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var trainer = Trainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = trainer.fullName
        priceLabel.text = "$\(trainer.price)"
        trainerImageView.image = trainer.image
        
    }
}
