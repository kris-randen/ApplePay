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
            
            let cellTrainers = trainers[indexPath.row]
            
            cell.nameLabel.text = cellTrainers.name
            cell.priceLabel.text = "$\(cellTrainers.price)"
            cell.trainerImageView.image = cellTrainers.image
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellTrainers = trainers[indexPath.row]
        performSegue(withIdentifier: Constants.SegueShowDetail, sender: cellTrainers)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? TrainerDetailViewController {
            if let sender = sender {
                if let trainer = sender as? Trainer {
                    detailVC.trainer = trainer
                }
            }
        }
    }

    private struct Constants {
        static let SegueShowDetail = "ShowDetail"
    }

}

