//
//  ShowAdViewController.swift
//  DickFighter
//
//  Created by Владимир Ефимов on 13.01.2022.
//  Copyright © 2022 Training. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ShowAdViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitial: GADInterstitial!
    let interAdUnitID = "ca-app-pub-7520736117933543/3864397277"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitial = GADInterstitial(adUnitID: interAdUnitID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.showAd()
        }

        // Do any additional setup after loading the view.
    }
    
    func showAd() {
        
        if (interstitial.isReady) {
            interstitial.present(fromRootViewController: self)
            interstitial = createAd()
        } else {
            print("INTER NOT READY")
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func createAd() -> GADInterstitial {
        let inter = GADInterstitial (adUnitID: interAdUnitID)
        inter.load(GADRequest())
        return inter
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.dismiss(animated: false, completion: nil)
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
