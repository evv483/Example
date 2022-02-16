//
//  PauseMenuViewController.swift
//  SpacegameReloaded
//
//  Created by Владимир Ефимов on 02.01.2022.
//  Copyright © 2022 Training. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PauseMenuViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitial: GADInterstitial!
    let interAdUnitID = "ca-app-pub-7520736117933543/3864397277"
    
    var toMapOfLevelsPressed = 0
    
    @IBOutlet weak var PauseLabel: UIImageView!
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var ToMapOfLevelsButton: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            
            print("NOT PURCHASED")

            if (interstitial.isReady) {
                interstitial.present(fromRootViewController: self)
                interstitial = createAd()
            } else {
                
                print("INTER NOT READY")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedFalse"), object:nil)
                UserDefaults.standard.set(false, forKey: "gamePaused")
                self.dismiss(animated: false, completion: nil)
            }
        } else {
            
            print("PURCHASED")
            UserDefaults.standard.set(false, forKey: "gamePaused")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedFalse"), object:nil)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func ToMapOfLevels(_ sender: Any) {
        
        toMapOfLevelsPressed = 1
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {

            print("NOT PURCHASED")

            if (interstitial.isReady) {
                interstitial.present(fromRootViewController: self)
                interstitial = createAd()
            } else {
                
                self.dismiss(animated: false, completion: nil)
                print("INTER NOT READY")
                UserDefaults.standard.set(false, forKey: "gamePaused")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"toMapOfLevels"), object:nil)
            }
        } else {
            
            self.dismiss(animated: false, completion: nil)
            print("PURCHASED")
            UserDefaults.standard.set(false, forKey: "gamePaused")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"toMapOfLevels"), object:nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitial = GADInterstitial(adUnitID: interAdUnitID)
        interstitial.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.dismissPauseMenu), name: NSNotification.Name(rawValue:"dismissPauseMenu"), object: nil)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interstitial.load(GADRequest())
    }
    
    @objc func dismissPauseMenu() {
        self.dismiss(animated: false, completion: nil)
    }
    
    func createAd() -> GADInterstitial {
        let inter = GADInterstitial (adUnitID: interAdUnitID)
        inter.load(GADRequest())
        return inter
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        if toMapOfLevelsPressed == 0 {
        
            self.dismiss(animated: false, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedFalse"), object:nil)
            UserDefaults.standard.set(false, forKey: "gamePaused")
        } else {

            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedFalse"), object:nil)
            UserDefaults.standard.set(false, forKey: "gamePaused")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"toMapOfLevels"), object:nil)
            self.dismiss(animated: false, completion: nil)
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
