//
//  ReachabilityViewController.swift
//  DickFighter
//
//  Created by Владимир Ефимов on 17.01.2022.
//  Copyright © 2022 Training. All rights reserved.
//
// Данный функционал был реализован с целью исключить сценарий убрать рекламу из игры, путем выключения передачи сотовых данных в настройках приложения или перехода в режим полета во время игры. В таких случаях пользователю будет показываться лейбл с необходимостью проверить интернет подключение, пока интернет подключение не появится. Если была совершена покупка, то данный функционал не используется.

import UIKit
import Foundation
import SystemConfiguration

func checkReachability() {
    print("checkReachability")
        if ReachabilityViewController.isConnectedToNetwork(){
            print("Internet Connection Available!")
            
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"timerReachabilityInvalidate"), object:nil)

//            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedFalse"), object:nil)

            
        } else {
            print("Internet Connection not Available!")
            
            if UserDefaults.standard.string(forKey: "currentScene") == "GameScene" {
                if UserDefaults.standard.bool(forKey: "presentReachabilityViewController") == false {
                    UserDefaults.standard.set(true, forKey: "presentReachabilityViewController")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"isPausedTrue"), object:nil)

                    if UserDefaults.standard.bool(forKey: "gamePaused") == true {
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"dismissPauseMenu"), object:nil)
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentReachabilityViewController"), object:nil)
                }
            }
        }
}

class ReachabilityViewController: UIViewController {
    
    @IBOutlet weak var ReachabilityLabel: UIImageView!
    @IBOutlet weak var backBTN: UIButton!
    
    @IBAction func backBTN(_ sender: Any) {
        
        if ReachabilityViewController.isConnectedToNetwork() {
            UserDefaults.standard.set(false, forKey: "presentReachabilityViewController")
            self.dismiss(animated: false, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentPauseMenu"), object:nil)

            
        } else {
            UserDefaults.standard.set(false, forKey: "presentReachabilityViewController")
            self.dismiss(animated: false, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentMainMenuScene"), object:nil)
        }
    }
    
    override func viewDidLoad() {
        ReachabilityLabel.image = UIImage(named: "reachabilityLabel")
    }
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
      
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret
    }
}
