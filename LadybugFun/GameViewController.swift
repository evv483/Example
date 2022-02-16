//
//  GameViewController.swift
//  DickFighter
//
//  Created by Владимир Ефимов on 08.01.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(false, forKey: "presentReachabilityViewController")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MainMenuScene") {
                // Set the scale mode to scale to fit the window
                // Present the scene
                view.presentScene(scene)
            }
                view.ignoresSiblingOrder = true
                view.preferredFramesPerSecond = 60
//                view.showsFPS = true
//                view.showsNodeCount = true
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentPauseMenu), name: NSNotification.Name(rawValue:"presentPauseMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentPurchaseViewController), name: NSNotification.Name(rawValue:"presentPurchaseViewController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentShowAdViewController), name: NSNotification.Name(rawValue:"presentShowAdViewController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentReachabilityViewController), name: NSNotification.Name(rawValue:"presentReachabilityViewController"), object: nil)
    }
    
    @objc func presentPauseMenu() {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "PauseMenuViewController") as! PauseMenuViewController
        VC.modalPresentationStyle = .overFullScreen
        self.present(VC, animated: true, completion: nil)
    }
    
    @objc func presentPurchaseViewController() {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
        VC.modalPresentationStyle = .overFullScreen
        self.present(VC, animated: false, completion: nil)
    }
    
    @objc func presentShowAdViewController() {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ShowAdViewController") as! ShowAdViewController
        VC.modalPresentationStyle = .overFullScreen
        self.present(VC, animated: true, completion: nil)
    }
    
    @objc func presentReachabilityViewController() {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ReachabilityViewController") as! ReachabilityViewController
        VC.modalPresentationStyle = .overFullScreen
        self.present(VC, animated: true, completion: nil)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
