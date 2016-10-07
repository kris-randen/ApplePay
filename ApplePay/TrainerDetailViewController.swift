//
//  TrainerDetailViewController.swift
//  ApplePay
//
//  Created by Kris Rajendren on Oct/6/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit
import PassKit

class TrainerDetailViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var applePayView: UIView!
    
    var trainer = Trainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = trainer.fullName
        priceLabel.text = "$\(trainer.price)"
        trainerImageView.image = trainer.image
        
        let applePayButton: PKPaymentButton
        
        if PKPaymentAuthorizationViewController.canMakePayments() {
            applePayButton = PKPaymentButton(type: .buy, style: .whiteOutline)
        } else {
            applePayButton = PKPaymentButton(type: .setUp, style: .whiteOutline)
        }
        
        view.layoutIfNeeded()
        
        applePayButton.addTarget(self, action: #selector(TrainerDetailViewController.applePayTapped), for: .touchUpInside)
        let multiplierX = CGFloat(1.00)
        let multiplierY = CGFloat(1.00)
        let buttonHeight = CGFloat(100.00)
        let buttonWidth = CGFloat(100.00)
        let offsetX = CGFloat(buttonWidth / 2)
        let offsetY = CGFloat(buttonHeight / 2)
        let midX = applePayView.bounds.midX
        let midY = applePayView.bounds.midY
        print("midX \(midX) midY \(midY)")
        let originX = (multiplierX * midX) - offsetX
        let originY = (multiplierY * midY) - offsetY
        let origin = CGPoint(x: originX, y: originY)
        let size = CGSize(width: 100, height: 100)
        applePayButton.frame = CGRect(origin: origin, size: size)
        applePayView.addSubview(applePayButton)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        completion(.invalidShippingPostalAddress)
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func applePayTapped() {
        let request = PKPaymentRequest()
        request.supportedNetworks = [
            .amex,
            .visa,
            .masterCard,
            .discover
        ]
        request.countryCode = "US"
        request.currencyCode = "USD"
        request.merchantIdentifier = "merchant.coach.campus.ApplePay"
        request.merchantCapabilities = [
            .capability3DS,
            .capabilityCredit,
            .capabilityDebit
        ]
        
        let applePay = PKPaymentSummaryItem(label: "\(trainer.name)'s Fee", amount: trainer.priceDecimal, type: .final)
        let total = PKPaymentSummaryItem(label: "Campus Coach", amount: 10.00, type: .final)
        
        request.paymentSummaryItems = [
            applePay,
            total
        ]
        
        let applePayViewController = PKPaymentAuthorizationViewController(paymentRequest: request)
        applePayViewController.delegate = self
        self.present(applePayViewController, animated: true, completion: nil)
    }
}
