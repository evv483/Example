//
//  PurchaseViewController.swift
//  DickFighter
//
//  Created by Владимир Ефимов on 12.01.2022.
//  Copyright © 2022 Training. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseViewController: UIViewController, SKPaymentTransactionObserver {
    
    let productID = "LBF.RemoveAds3"
    
    @IBOutlet weak var purchaseLabel: UIImageView!
    @IBOutlet weak var purchaseBTNOutlet: UIButton!
    @IBOutlet weak var restoreBTNOutlet: UIButton!
    @IBOutlet weak var backBTNPurchaseOutlet: UIButton!
    @IBOutlet weak var backToMainMenuBTNOutlet: UIButton!
    @IBOutlet weak var fadedMenuBTNOutlet: UIImageView!
    
    @IBAction func purchaseBTN(_ sender: Any) {
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            print("PURCHASE PRESSED")
        }
    }
   
    @IBAction func restoreBTN(_ sender: Any) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
        print("RESTORE PRESSED")
    }
    
    @IBAction func backBTNPurchase(_ sender: Any) {
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            purchaseLabel.image = UIImage(named: "makePurchaseLabel")
            fadedMenuBTNOutlet.isHidden = true
            } else {
                purchaseLabel.image = UIImage(named: "adsRemovedPurchaseLabel")
                fadedMenuBTNOutlet.isHidden = false
                purchaseBTNOutlet.isEnabled = false
            }
        
        purchaseBTNOutlet.isHidden = false
        restoreBTNOutlet.isHidden = false
        backToMainMenuBTNOutlet.isHidden = false
        purchaseBTNOutlet.isEnabled = false
    }
    
    @IBAction func backToMainMenuBTN(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"mainMenuNodesIsHiddenFalse"), object:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        SKPaymentQueue.default().add(self)
        print(SKPaymentQueue.default().transactions)
        
        print("PURCHASE \(UserDefaults.standard.bool(forKey: "Purchase"))")
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            purchaseLabel.image = UIImage(named: "makePurchaseLabel")
            fadedMenuBTNOutlet.isHidden = true
            } else {
                purchaseLabel.image = UIImage(named: "adsRemovedPurchaseLabel")
                fadedMenuBTNOutlet.isHidden = false
                purchaseBTNOutlet.isEnabled = false
            }
        
        backBTNPurchaseOutlet.layer.zPosition = 1
        purchaseBTNOutlet.layer.zPosition = 2
        restoreBTNOutlet.layer.zPosition = 2
        backToMainMenuBTNOutlet.layer.zPosition = 2
        fadedMenuBTNOutlet.layer.zPosition = 3

        // Do any additional setup after loading the view.
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        print("func paymentQueue")
        
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                
                UserDefaults.standard.set(true, forKey: "Purchase")
                SKPaymentQueue.default().finishTransaction(transaction as SKPaymentTransaction)
                print("PURCHASE DONE")
                
                purchaseLabel.image = UIImage(named: "purchaseSuccessfulLabel")
                purchaseBTNOutlet.isHidden = true
                restoreBTNOutlet.isHidden = true
                backToMainMenuBTNOutlet.isHidden = true
                
            } else if transaction.transactionState == .failed {
                
                print("PURCHASE FAILED")
                
                purchaseLabel.image = UIImage(named: "purchaseFailedLabel")
                purchaseBTNOutlet.isHidden = true
                restoreBTNOutlet.isHidden = true
                backToMainMenuBTNOutlet.isHidden = true

            } else if transaction.transactionState == .restored {
                
                UserDefaults.standard.set(true, forKey: "Purchase")
                SKPaymentQueue.default().finishTransaction(transaction as SKPaymentTransaction)
                print ("RESTORED")
                
                purchaseLabel.image = UIImage(named: "purchaseRestoredLabel")
                purchaseBTNOutlet.isHidden = true
                restoreBTNOutlet.isHidden = true
                backToMainMenuBTNOutlet.isHidden = true
                fadedMenuBTNOutlet.isHidden = true
            }
        }
    }
    
    public func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if (queue.transactions.count == 0) {
            print("Nothing to restore...")
            let alertController = UIAlertController(title: "Hi", message: "Nothing to restore...", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
