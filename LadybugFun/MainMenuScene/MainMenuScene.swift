//
//  MainMenuScene.swift
//  SpacegameReloaded
//
//  Created by Владимир Ефимов on 14.06.2021.
//  Copyright © 2021 Training. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    
    var background:SKSpriteNode!
    var firstLevelBTN:SKSpriteNode!
    var scoreLabelBTN:SKSpriteNode!
    var scoreLabel:SKLabelNode!
    
    var titleLabel:SKLabelNode!
    var newGameBTN:SKSpriteNode!
    var infoBTN:SKSpriteNode!
    var purchaseFailedLabel:SKSpriteNode!
    var purchaseRestoredLabel:SKSpriteNode!
    var purchaseSuccessfulLabel:SKSpriteNode!

    var mainMenuBackground:SKSpriteNode!
    var title2:SKSpriteNode!
    var infoLabel:SKSpriteNode!
    var getAccessBTN:SKSpriteNode!
    var restoreBTN:SKSpriteNode!
    var backBTN:SKSpriteNode!
    
    enum CollisionType: UInt32 {
        case player = 1
        case object = 2
    }
    
    override func didMove(to view: SKView) {
        print("didMove MainMenuScene")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"timerReachabilityInvalidate"), object:nil)

        let currentScene = SKScene(fileNamed: "MainMenuScene")!
        currentScene.name = "MainMenuScene"
        print("sceneMainMenuScene name: \(currentScene.name!)")
        UserDefaults.standard.set(currentScene.name, forKey: "currentScene")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.mainMenuNodesIsHiddenFalse), name: NSNotification.Name(rawValue:"mainMenuNodesIsHiddenFalse"), object: nil)
                        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            background = SKSpriteNode(imageNamed: "mainMenuBackgroundDark")
            mainMenuBackground = SKSpriteNode(imageNamed: "mainMenuButtonsBackgroundDark")
        } else {
                background = SKSpriteNode(imageNamed: "mainMenuBackground")
                mainMenuBackground = SKSpriteNode(imageNamed: "mainMenuButtonsBackground")
            }
        
        background.zPosition = -1
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(background)
        
        mainMenuBackground.zPosition = 2
        mainMenuBackground.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 )
        self.addChild(mainMenuBackground)
        
        newGameBTN = SKSpriteNode(imageNamed: "startBTN")
        newGameBTN.zPosition = 3
        newGameBTN.name = "newGameBTN"
        newGameBTN.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 )
        self.addChild(newGameBTN)
        
        title2 = SKSpriteNode(imageNamed: "MAIN MENU3")
        title2.zPosition = 3
        title2.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 + 106)
        self.addChild(title2)
        
        infoBTN = SKSpriteNode(imageNamed: "infoBTN")
        infoBTN.zPosition = 3
        infoBTN.name = "infoBTN"
        infoBTN.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 98)
        self.addChild(infoBTN)
        
        UserDefaults.standard.set(13, forKey: "level")
        nextLevel()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [self]_ in
            run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addObject3),SKAction.wait(forDuration: 0.5)])))
        })
    }
    
    func addObject3() {
        
        let arrayNodeName3 = UserDefaults.standard.array(forKey: "LevelObjects3")!.randomElement()! as! String
        
        let object3 = SKSpriteNode(imageNamed: arrayNodeName3)

        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width))
        let position = CGFloat(randomPosition.nextInt())
        
//        print(arrayNodeName3)

        object3.name = "object3"
        object3.position = CGPoint(x: position, y: self.frame.size.height + object3.size.height)
        object3.zPosition = 1
        object3.physicsBody = SKPhysicsBody(circleOfRadius: object3.size.width)
        object3.physicsBody?.isDynamic = false
        object3.physicsBody?.categoryBitMask = CollisionType.object.rawValue
        object3.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        object3.physicsBody?.collisionBitMask = 0
        
        
        let animationDuration: TimeInterval = Double.random(in: UserDefaults.standard.double(forKey: "animationDurationObject3Min")...UserDefaults.standard.double(forKey: "animationDurationObject3Max"))
        let actionMove = SKAction.move(to: CGPoint(x: position, y: -object3.size.height),
                                             duration: TimeInterval(animationDuration))
        let actionMoveDone = SKAction.removeFromParent()
        object3.run(SKAction.sequence([actionMove, actionMoveDone]))
            
        self.addChild(object3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameBTN" {
                self.view?.presentScene(MapOfLevels(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "infoBTN" {
                
                mainMenuBackground.isHidden = true
                title2.isHidden = true
                newGameBTN.isHidden = true
                infoBTN.isHidden = true
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentPurchaseViewController"), object:nil)
            }
        }
    }
    
    @objc func mainMenuNodesIsHiddenFalse() {
        mainMenuBackground.isHidden = false
        title2.isHidden = false
        newGameBTN.isHidden = false
        infoBTN.isHidden = false
    }
}
