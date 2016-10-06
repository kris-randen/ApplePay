//
//  Trainer.swift
//  ApplePay
//
//  Created by Kris Rajendren on Oct/6/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class Trainer {
    var name: String
    var fullName: String
    var price: Double
    var priceDecimal: NSDecimalNumber
    var image: UIImage?
    
    init(name: String = "", fullName: String = "Monica Bellucci", price: Double = 10.00, image: UIImage? = nil) {
        self.name = name
        self.fullName = fullName
        self.price = price
        self.priceDecimal = NSDecimalNumber(string: "\(self.price)")
        self.image = image
    }
}

let monicaImage = UIImage(named: "Monica Bellucci I")
let branchImage = UIImage(named: "Branch Warren I")
let monica = Trainer(name: "Monica", price: 10.00, image: monicaImage)
let branch = Trainer(name: "Branch", price: 09.00, image: branchImage)

let trainers = [monica, branch]

