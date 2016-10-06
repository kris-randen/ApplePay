//
//  ViewController.swift
//  ApplePay
//
//  Created by Kris Rajendren on Oct/5/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TrainerTableViewCell {
            
            cell.nameLabel.text = trainers[indexPath.row].name
            cell.priceLabel.text = "$\(trainers[indexPath.row].price)"
            cell.trainerImageView.image = trainers[indexPath.row].image
            
            return cell
        } else {
            return UITableViewCell()
        }
    }


}

