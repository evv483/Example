//
//  MapOfLevels.swift
//  SpacegameReloaded
//
//  Created by Владимир Ефимов on 14.06.2021.
//  Copyright © 2021 Training. All rights reserved.
//

import SpriteKit

class MapOfLevels: SKScene {
    
    var background:SKSpriteNode!
    
    var backBTN:SKSpriteNode!

    var firstLevelBTN:SKSpriteNode!
    var firstScoreLabelBTN:SKSpriteNode!
    var firstScoreLabel:SKLabelNode!
    
    var secondLevelBTN:SKSpriteNode!
    var secondScoreLabelBTN:SKSpriteNode!
    var secondScoreLabel:SKLabelNode!
    var secondfadedLevelBTN:SKSpriteNode!
    var secondfadedScoreLabelBTN:SKSpriteNode!
    
    var thirdLevelBTN:SKSpriteNode!
    var thirdScoreLabelBTN:SKSpriteNode!
    var thirdScoreLabel:SKLabelNode!
    var thirdfadedLevelBTN:SKSpriteNode!
    var thirdfadedScoreLabelBTN:SKSpriteNode!
    
    var fourthLevelBTN:SKSpriteNode!
    var fourthScoreLabelBTN:SKSpriteNode!
    var fourthScoreLabel:SKLabelNode!
    var fourthfadedLevelBTN:SKSpriteNode!
    var fourthfadedScoreLabelBTN:SKSpriteNode!
    
    var fifthLevelBTN:SKSpriteNode!
    var fifthScoreLabelBTN:SKSpriteNode!
    var fifthScoreLabel:SKLabelNode!
    var fifthfadedLevelBTN:SKSpriteNode!
    var fifthfadedScoreLabelBTN:SKSpriteNode!
    
    var sixthLevelBTN:SKSpriteNode!
    var sixthScoreLabelBTN:SKSpriteNode!
    var sixthScoreLabel:SKLabelNode!
    var sixthfadedLevelBTN:SKSpriteNode!
    var sixthfadedScoreLabelBTN:SKSpriteNode!
    
    var seventhLevelBTN:SKSpriteNode!
    var seventhScoreLabelBTN:SKSpriteNode!
    var seventhScoreLabel:SKLabelNode!
    var seventhfadedLevelBTN:SKSpriteNode!
    var seventhfadedScoreLabelBTN:SKSpriteNode!
    
    var eighthLevelBTN:SKSpriteNode!
    var eighthScoreLabelBTN:SKSpriteNode!
    var eighthScoreLabel:SKLabelNode!
    var eighthfadedLevelBTN:SKSpriteNode!
    var eighthfadedScoreLabelBTN:SKSpriteNode!
    
    var ninthLevelBTN:SKSpriteNode!
    var ninthScoreLabelBTN:SKSpriteNode!
    var ninthScoreLabel:SKLabelNode!
    var ninthfadedLevelBTN:SKSpriteNode!
    var ninthfadedScoreLabelBTN:SKSpriteNode!
    
    var tenthLevelBTN:SKSpriteNode!
    var tenthScoreLabelBTN:SKSpriteNode!
    var tenthScoreLabel:SKLabelNode!
    var tenthfadedLevelBTN:SKSpriteNode!
    var tenthfadedScoreLabelBTN:SKSpriteNode!
    
    var eleventhLevelBTN:SKSpriteNode!
    var eleventhScoreLabelBTN:SKSpriteNode!
    var eleventhScoreLabel:SKLabelNode!
    var eleventhfadedLevelBTN:SKSpriteNode!
    var eleventhfadedScoreLabelBTN:SKSpriteNode!
    
    var twelfthLevelBTN:SKSpriteNode!
    var twelfthScoreLabelBTN:SKSpriteNode!
    var twelfthScoreLabel:SKLabelNode!
    var twelfthfadedLevelBTN:SKSpriteNode!
    var twelfthfadedScoreLabelBTN:SKSpriteNode!
    
    var thirteenthLevelBTN:SKSpriteNode!
    var thirteenthScoreLabelBTN:SKSpriteNode!
    var thirteenthScoreLabel:SKLabelNode!
    var thirteenthfadedLevelBTN:SKSpriteNode!
    var thirteenthfadedScoreLabelBTN:SKSpriteNode!
    
    var fourteenthLevelBTN:SKSpriteNode!
    var fourteenthScoreLabelBTN:SKSpriteNode!
    var fourteenthScoreLabel:SKLabelNode!
    var fourteenthfadedLevelBTN:SKSpriteNode!
    var fourteenthfadedScoreLabelBTN:SKSpriteNode!
    
    var fifteenthLevelBTN:SKSpriteNode!
    var fifteenthScoreLabelBTN:SKSpriteNode!
    var fifteenthScoreLabel:SKLabelNode!
    var fifteenthfadedLevelBTN:SKSpriteNode!
    var fifteenthfadedScoreLabelBTN:SKSpriteNode!
    
    let scoreLabelFontSize: CGFloat = 15
    let scoreLabelFontColor = UIColor.white
    
    override func didMove(to view: SKView) {
        print("didMove MapOfLevels")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"timerReachabilityInvalidate"), object:nil)

        let currentScene = SKScene(fileNamed: "MapOfLevels")!
        currentScene.name = "MapOfLevels"
        print("sceneMapOfLevels name: \(currentScene.name!)")
        UserDefaults.standard.set(currentScene.name, forKey: "currentScene")
        
//        print(self.view!.frame.width)
//        print(self.view!.frame.height)
//        print(self.size.width)
//        print(self.size.height)
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            background = SKSpriteNode(imageNamed: "mainMenuBackgroundDark")
        } else {
                background = SKSpriteNode(imageNamed: "mainMenuBackground")
            }
        
        background.zPosition = -1
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(background)
        
        firstLevelBTN = SKSpriteNode(imageNamed: "firstLevelBTN")
        firstLevelBTN.name = "firstLevelBTN"
        firstLevelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.84)
        
        firstScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        firstScoreLabelBTN.name = "firstLevelBTN"
        firstScoreLabelBTN.zPosition = 1
        firstScoreLabelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.84 - firstLevelBTN.size.height / 2)
        
        firstScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score1level"))/10")
        firstScoreLabel.fontName = "AmericanTypewriter-Bold"
        firstScoreLabel.fontSize = scoreLabelFontSize
        firstScoreLabel.fontColor = scoreLabelFontColor
        firstScoreLabel.verticalAlignmentMode = .center
        firstScoreLabel.zPosition = 2
                
        self.addChild(firstLevelBTN)
        firstScoreLabelBTN.addChild(firstScoreLabel)
        self.addChild(firstScoreLabelBTN)
        
        secondLevelBTN = SKSpriteNode(imageNamed: "secondLevelBTN")
        secondLevelBTN.name = "secondLevelBTN"
        secondLevelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.84)
        
        secondScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        secondScoreLabelBTN.name = "secondLevelBTN"
        secondScoreLabelBTN.zPosition = 1
        secondScoreLabelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.84 - secondLevelBTN.size.height / 2)
        
        secondScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score2level"))/15")
        secondScoreLabel.fontName = "AmericanTypewriter-Bold"
        secondScoreLabel.fontSize = scoreLabelFontSize
        secondScoreLabel.fontColor = scoreLabelFontColor
        secondScoreLabel.verticalAlignmentMode = .center
        secondScoreLabel.zPosition = 2
                
        self.addChild(secondLevelBTN)
        secondScoreLabelBTN.addChild(secondScoreLabel)
        self.addChild(secondScoreLabelBTN)
        
        thirdLevelBTN = SKSpriteNode(imageNamed: "thirdLevelBTN")
        thirdLevelBTN.name = "thirdLevelBTN"
        thirdLevelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.84)
        
        thirdScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        thirdScoreLabelBTN.name = "thirdLevelBTN"
        thirdScoreLabelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.84 - thirdLevelBTN.size.height / 2)
        thirdScoreLabelBTN.zPosition = 1

        thirdScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score3level"))/20")
        thirdScoreLabel.fontName = "AmericanTypewriter-Bold"
        thirdScoreLabel.fontSize = scoreLabelFontSize
        thirdScoreLabel.fontColor = scoreLabelFontColor
        thirdScoreLabel.verticalAlignmentMode = .center
        thirdScoreLabel.zPosition = 2
        
        self.addChild(thirdLevelBTN)
        thirdScoreLabelBTN.addChild(thirdScoreLabel)
        self.addChild(thirdScoreLabelBTN)
        
        fourthLevelBTN = SKSpriteNode(imageNamed: "fourthLevelBTN")
        fourthLevelBTN.name = "fourthLevelBTN"
        fourthLevelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.68)
        
        fourthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        fourthScoreLabelBTN.name = "fourthLevelBTN"
        fourthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.68 - fourthLevelBTN.size.height / 2)
        fourthScoreLabelBTN.zPosition = 1

        fourthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score4level"))/25")
        fourthScoreLabel.fontName = "AmericanTypewriter-Bold"
        fourthScoreLabel.fontSize = scoreLabelFontSize
        fourthScoreLabel.fontColor = scoreLabelFontColor
        fourthScoreLabel.verticalAlignmentMode = .center
        fourthScoreLabel.zPosition = 2
        
        self.addChild(fourthLevelBTN)
        fourthScoreLabelBTN.addChild(fourthScoreLabel)
        self.addChild(fourthScoreLabelBTN)
        
        fifthLevelBTN = SKSpriteNode(imageNamed: "fifthLevelBTN")
        fifthLevelBTN.name = "fifthLevelBTN"
        fifthLevelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.68)
        
        fifthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        fifthScoreLabelBTN.name = "fifthLevelBTN"
        fifthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.68 - fifthLevelBTN.size.height / 2)
        fifthScoreLabelBTN.zPosition = 1

        fifthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score5level"))/30")
        fifthScoreLabel.fontName = "AmericanTypewriter-Bold"
        fifthScoreLabel.fontSize = scoreLabelFontSize
        fifthScoreLabel.fontColor = scoreLabelFontColor
        fifthScoreLabel.verticalAlignmentMode = .center
        fifthScoreLabel.zPosition = 2
        
        self.addChild(fifthLevelBTN)
        fifthScoreLabelBTN.addChild(fifthScoreLabel)
        self.addChild(fifthScoreLabelBTN)
        
        sixthLevelBTN = SKSpriteNode(imageNamed: "sixthLevelBTN")
        sixthLevelBTN.name = "sixthLevelBTN"
        sixthLevelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.68)
        
        sixthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        sixthScoreLabelBTN.name = "sixthLevelBTN"
        sixthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.68 - sixthLevelBTN.size.height / 2)
        sixthScoreLabelBTN.zPosition = 1

        sixthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score6level"))/35")
        sixthScoreLabel.fontName = "AmericanTypewriter-Bold"
        sixthScoreLabel.fontSize = scoreLabelFontSize
        sixthScoreLabel.fontColor = scoreLabelFontColor
        sixthScoreLabel.verticalAlignmentMode = .center
        sixthScoreLabel.zPosition = 2
        
        self.addChild(sixthLevelBTN)
        sixthScoreLabelBTN.addChild(sixthScoreLabel)
        self.addChild(sixthScoreLabelBTN)
        
        seventhLevelBTN = SKSpriteNode(imageNamed: "seventhLevelBTN")
        seventhLevelBTN.name = "seventhLevelBTN"
        seventhLevelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.52)
        
        seventhScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        seventhScoreLabelBTN.name = "seventhLevelBTN"
        seventhScoreLabelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.52 - seventhLevelBTN.size.height / 2)
        seventhScoreLabelBTN.zPosition = 1

        seventhScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score7level"))/40")
        seventhScoreLabel.fontName = "AmericanTypewriter-Bold"
        seventhScoreLabel.fontSize = scoreLabelFontSize
        seventhScoreLabel.fontColor = scoreLabelFontColor
        seventhScoreLabel.verticalAlignmentMode = .center
        seventhScoreLabel.zPosition = 2
        
        self.addChild(seventhLevelBTN)
        seventhScoreLabelBTN.addChild(seventhScoreLabel)
        self.addChild(seventhScoreLabelBTN)
        
        eighthLevelBTN = SKSpriteNode(imageNamed: "eighthLevelBTN")
        eighthLevelBTN.name = "eighthLevelBTN"
        eighthLevelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.52)
        
        eighthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        eighthScoreLabelBTN.name = "eighthLevelBTN"
        eighthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.52 - eighthLevelBTN.size.height / 2)
        eighthScoreLabelBTN.zPosition = 1

        eighthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score8level"))/45")
        eighthScoreLabel.fontName = "AmericanTypewriter-Bold"
        eighthScoreLabel.fontSize = scoreLabelFontSize
        eighthScoreLabel.fontColor = scoreLabelFontColor
        eighthScoreLabel.verticalAlignmentMode = .center
        eighthScoreLabel.zPosition = 2
        
        self.addChild(eighthLevelBTN)
        eighthScoreLabelBTN.addChild(eighthScoreLabel)
        self.addChild(eighthScoreLabelBTN)
        
        ninthLevelBTN = SKSpriteNode(imageNamed: "ninthLevelBTN")
        ninthLevelBTN.name = "ninthLevelBTN"
        ninthLevelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.52)
        
        ninthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        ninthScoreLabelBTN.name = "ninthLevelBTN"
        ninthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.52 - ninthLevelBTN.size.height / 2)
        ninthScoreLabelBTN.zPosition = 1

        ninthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score9level"))/50")
        ninthScoreLabel.fontName = "AmericanTypewriter-Bold"
        ninthScoreLabel.fontSize = scoreLabelFontSize
        ninthScoreLabel.fontColor = scoreLabelFontColor
        ninthScoreLabel.verticalAlignmentMode = .center
        ninthScoreLabel.zPosition = 2
        
        self.addChild(ninthLevelBTN)
        ninthScoreLabelBTN.addChild(ninthScoreLabel)
        self.addChild(ninthScoreLabelBTN)
        
        tenthLevelBTN = SKSpriteNode(imageNamed: "tenthLevelBTN")
        tenthLevelBTN.name = "tenthLevelBTN"
        tenthLevelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.36)
        
        tenthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        tenthScoreLabelBTN.name = "tenthLevelBTN"
        tenthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.36 - tenthLevelBTN.size.height / 2)
        tenthScoreLabelBTN.zPosition = 1

        tenthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score10level"))/55")
        tenthScoreLabel.fontName = "AmericanTypewriter-Bold"
        tenthScoreLabel.fontSize = scoreLabelFontSize
        tenthScoreLabel.fontColor = scoreLabelFontColor
        tenthScoreLabel.verticalAlignmentMode = .center
        tenthScoreLabel.zPosition = 2
        
        self.addChild(tenthLevelBTN)
        tenthScoreLabelBTN.addChild(tenthScoreLabel)
        self.addChild(tenthScoreLabelBTN)
        
        eleventhLevelBTN = SKSpriteNode(imageNamed: "eleventhLevelBTN")
        eleventhLevelBTN.name = "eleventhLevelBTN"
        eleventhLevelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.36)
        
        eleventhScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        eleventhScoreLabelBTN.name = "eleventhLevelBTN"
        eleventhScoreLabelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.36 - eleventhLevelBTN.size.height / 2)
        eleventhScoreLabelBTN.zPosition = 1

        eleventhScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score11level"))/60")
        eleventhScoreLabel.fontName = "AmericanTypewriter-Bold"
        eleventhScoreLabel.fontSize = scoreLabelFontSize
        eleventhScoreLabel.fontColor = scoreLabelFontColor
        eleventhScoreLabel.verticalAlignmentMode = .center
        eleventhScoreLabel.zPosition = 2
        
        self.addChild(eleventhLevelBTN)
        eleventhScoreLabelBTN.addChild(eleventhScoreLabel)
        self.addChild(eleventhScoreLabelBTN)
        
        twelfthLevelBTN = SKSpriteNode(imageNamed: "twelfthLevelBTN")
        twelfthLevelBTN.name = "twelfthLevelBTN"
        twelfthLevelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.36)
        
        twelfthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        twelfthScoreLabelBTN.name = "twelfthLevelBTN"
        twelfthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.36 - twelfthLevelBTN.size.height / 2)
        twelfthScoreLabelBTN.zPosition = 1

        twelfthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score12level"))/65")
        twelfthScoreLabel.fontName = "AmericanTypewriter-Bold"
        twelfthScoreLabel.fontSize = scoreLabelFontSize
        twelfthScoreLabel.fontColor = scoreLabelFontColor
        twelfthScoreLabel.verticalAlignmentMode = .center
        twelfthScoreLabel.zPosition = 2
        
        self.addChild(twelfthLevelBTN)
        twelfthScoreLabelBTN.addChild(twelfthScoreLabel)
        self.addChild(twelfthScoreLabelBTN)
        
        thirteenthLevelBTN = SKSpriteNode(imageNamed: "thirteenthLevelBTN")
        thirteenthLevelBTN.name = "thirteenthLevelBTN"
        thirteenthLevelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.20)
        
        thirteenthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        thirteenthScoreLabelBTN.name = "thirteenthLevelBTN"
        thirteenthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.20 - thirteenthLevelBTN.size.height / 2)
        thirteenthScoreLabelBTN.zPosition = 1

        thirteenthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score13level"))/70")
        thirteenthScoreLabel.fontName = "AmericanTypewriter-Bold"
        thirteenthScoreLabel.fontSize = scoreLabelFontSize
        thirteenthScoreLabel.fontColor = scoreLabelFontColor
        thirteenthScoreLabel.verticalAlignmentMode = .center
        thirteenthScoreLabel.zPosition = 2
        
        self.addChild(thirteenthLevelBTN)
        thirteenthScoreLabelBTN.addChild(thirteenthScoreLabel)
        self.addChild(thirteenthScoreLabelBTN)
        
        fourteenthLevelBTN = SKSpriteNode(imageNamed: "fourteenthLevelBTN")
        fourteenthLevelBTN.name = "fourteenthLevelBTN"
        fourteenthLevelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.20)
        
        fourteenthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        fourteenthScoreLabelBTN.name = "fourteenthLevelBTN"
        fourteenthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.20 - fourteenthLevelBTN.size.height / 2)
        fourteenthScoreLabelBTN.zPosition = 1

        fourteenthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score14level"))/75")
        fourteenthScoreLabel.fontName = "AmericanTypewriter-Bold"
        fourteenthScoreLabel.fontSize = scoreLabelFontSize
        fourteenthScoreLabel.fontColor = scoreLabelFontColor
        fourteenthScoreLabel.verticalAlignmentMode = .center
        fourteenthScoreLabel.zPosition = 2
        
        self.addChild(fourteenthLevelBTN)
        fourteenthScoreLabelBTN.addChild(fourteenthScoreLabel)
        self.addChild(fourteenthScoreLabelBTN)
        
        fifteenthLevelBTN = SKSpriteNode(imageNamed: "fifteenthLevelBTN")
        fifteenthLevelBTN.name = "fifteenthLevelBTN"
        fifteenthLevelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.20)
        
        fifteenthScoreLabelBTN = SKSpriteNode(imageNamed: "scoreLabelBTN")
        fifteenthScoreLabelBTN.name = "fifteenthLevelBTN"
        fifteenthScoreLabelBTN.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.20 - fifteenthLevelBTN.size.height / 2)
        fifteenthScoreLabelBTN.zPosition = 1

        fifteenthScoreLabel = SKLabelNode(text: "\(UserDefaults.standard.integer(forKey: "score15level"))/80")
        fifteenthScoreLabel.fontName = "AmericanTypewriter-Bold"
        fifteenthScoreLabel.fontSize = scoreLabelFontSize
        fifteenthScoreLabel.fontColor = scoreLabelFontColor
        fifteenthScoreLabel.verticalAlignmentMode = .center
        fifteenthScoreLabel.zPosition = 2
        
        self.addChild(fifteenthLevelBTN)
        fifteenthScoreLabelBTN.addChild(fifteenthScoreLabel)
        self.addChild(fifteenthScoreLabelBTN)
        
        backBTN = SKSpriteNode(imageNamed: "backBTN2")
        backBTN.name = "backBTN"
        backBTN.position = CGPoint(x: self.size.width * 0.5, y: fourteenthLevelBTN.position.y - fourteenthLevelBTN.size.height / 2 - backBTN.size.height * 1.5)
        self.addChild(backBTN)

        if UserDefaults.standard.bool(forKey: "1levelCompleted") == false {
            secondfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            secondfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            secondfadedLevelBTN.position = secondLevelBTN.position
            secondfadedLevelBTN.zPosition = 0.5
            secondfadedScoreLabelBTN.position = secondScoreLabelBTN.position
            secondfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(secondfadedLevelBTN)
            self.addChild(secondfadedScoreLabelBTN)
            secondScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "2levelCompleted") == false {
            thirdfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            thirdfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            thirdfadedLevelBTN.position = thirdLevelBTN.position
            thirdfadedLevelBTN.zPosition = 0.5
            thirdfadedScoreLabelBTN.position = thirdScoreLabelBTN.position
            thirdfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(thirdfadedLevelBTN)
            self.addChild(thirdfadedScoreLabelBTN)
            thirdScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "3levelCompleted") == false {
            fourthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            fourthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            fourthfadedLevelBTN.position = fourthLevelBTN.position
            fourthfadedLevelBTN.zPosition = 0.5
            fourthfadedScoreLabelBTN.position = fourthScoreLabelBTN.position
            fourthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(fourthfadedLevelBTN)
            self.addChild(fourthfadedScoreLabelBTN)
            fourthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "4levelCompleted") == false {
            fifthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            fifthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            fifthfadedLevelBTN.position = fifthLevelBTN.position
            fifthfadedLevelBTN.zPosition = 0.5
            fifthfadedScoreLabelBTN.position = fifthScoreLabelBTN.position
            fifthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(fifthfadedLevelBTN)
            self.addChild(fifthfadedScoreLabelBTN)
            fifthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "5levelCompleted") == false {
            sixthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            sixthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            sixthfadedLevelBTN.position = sixthLevelBTN.position
            sixthfadedLevelBTN.zPosition = 0.5
            sixthfadedScoreLabelBTN.position = sixthScoreLabelBTN.position
            sixthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(sixthfadedLevelBTN)
            self.addChild(sixthfadedScoreLabelBTN)
            sixthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "6levelCompleted") == false {
            seventhfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            seventhfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            seventhfadedLevelBTN.position = seventhLevelBTN.position
            seventhfadedLevelBTN.zPosition = 0.5
            seventhfadedScoreLabelBTN.position = seventhScoreLabelBTN.position
            seventhfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(seventhfadedLevelBTN)
            self.addChild(seventhfadedScoreLabelBTN)
            seventhScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "7levelCompleted") == false {
            eighthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            eighthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            eighthfadedLevelBTN.position = eighthLevelBTN.position
            eighthfadedLevelBTN.zPosition = 0.5
            eighthfadedScoreLabelBTN.position = eighthScoreLabelBTN.position
            eighthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(eighthfadedLevelBTN)
            self.addChild(eighthfadedScoreLabelBTN)
            eighthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "8levelCompleted") == false {
            ninthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            ninthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            ninthfadedLevelBTN.position = ninthLevelBTN.position
            ninthfadedLevelBTN.zPosition = 0.5
            ninthfadedScoreLabelBTN.position = ninthScoreLabelBTN.position
            ninthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(ninthfadedLevelBTN)
            self.addChild(ninthfadedScoreLabelBTN)
            ninthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "9levelCompleted") == false {
            tenthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            tenthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            tenthfadedLevelBTN.position = tenthLevelBTN.position
            tenthfadedLevelBTN.zPosition = 0.5
            tenthfadedScoreLabelBTN.position = tenthScoreLabelBTN.position
            tenthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(tenthfadedLevelBTN)
            self.addChild(tenthfadedScoreLabelBTN)
            tenthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "10levelCompleted") == false {
            eleventhfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            eleventhfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            eleventhfadedLevelBTN.position = eleventhLevelBTN.position
            eleventhfadedLevelBTN.zPosition = 0.5
            eleventhfadedScoreLabelBTN.position = eleventhScoreLabelBTN.position
            eleventhfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(eleventhfadedLevelBTN)
            self.addChild(eleventhfadedScoreLabelBTN)
            eleventhScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "11levelCompleted") == false {
            twelfthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            twelfthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            twelfthfadedLevelBTN.position = twelfthLevelBTN.position
            twelfthfadedLevelBTN.zPosition = 0.5
            twelfthfadedScoreLabelBTN.position = twelfthScoreLabelBTN.position
            twelfthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(twelfthfadedLevelBTN)
            self.addChild(twelfthfadedScoreLabelBTN)
            twelfthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "12levelCompleted") == false {
            thirteenthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            thirteenthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            thirteenthfadedLevelBTN.position = thirteenthLevelBTN.position
            thirteenthfadedLevelBTN.zPosition = 0.5
            thirteenthfadedScoreLabelBTN.position = thirteenthScoreLabelBTN.position
            thirteenthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(thirteenthfadedLevelBTN)
            self.addChild(thirteenthfadedScoreLabelBTN)
            thirteenthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "13levelCompleted") == false {
            fourteenthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            fourteenthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            fourteenthfadedLevelBTN.position = fourteenthLevelBTN.position
            fourteenthfadedLevelBTN.zPosition = 0.5
            fourteenthfadedScoreLabelBTN.position = fourteenthScoreLabelBTN.position
            fourteenthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(fourteenthfadedLevelBTN)
            self.addChild(fourteenthfadedScoreLabelBTN)
            fourteenthScoreLabel.removeFromParent()
        }
        
        if UserDefaults.standard.bool(forKey: "14levelCompleted") == false {
            fifteenthfadedLevelBTN = SKSpriteNode(imageNamed: "fadedLevelBTN")
            fifteenthfadedScoreLabelBTN = SKSpriteNode(imageNamed: "fadedScoreLabelBTN")
            fifteenthfadedLevelBTN.position = fifteenthLevelBTN.position
            fifteenthfadedLevelBTN.zPosition = 0.5
            fifteenthfadedScoreLabelBTN.position = fifteenthScoreLabelBTN.position
            fifteenthfadedScoreLabelBTN.zPosition = 2.5
            self.addChild(fifteenthfadedLevelBTN)
            self.addChild(fifteenthfadedScoreLabelBTN)
            fifteenthScoreLabel.removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "firstLevelBTN" {                
                UserDefaults.standard.set(1, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "secondLevelBTN" {
                UserDefaults.standard.set(2, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "thirdLevelBTN" {
                UserDefaults.standard.set(3, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "fourthLevelBTN" {
                UserDefaults.standard.set(4, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "fifthLevelBTN" {
                UserDefaults.standard.set(5, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "sixthLevelBTN" {
                UserDefaults.standard.set(6, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "seventhLevelBTN" {
                UserDefaults.standard.set(7, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "eighthLevelBTN" {
                
                UserDefaults.standard.set(8, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "ninthLevelBTN" {
                
                UserDefaults.standard.set(9, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "tenthLevelBTN" {
                UserDefaults.standard.set(10, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "eleventhLevelBTN" {
                UserDefaults.standard.set(11, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "twelfthLevelBTN" {
                UserDefaults.standard.set(12, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "thirteenthLevelBTN" {
                UserDefaults.standard.set(13, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "fourteenthLevelBTN" {
                UserDefaults.standard.set(14, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "fifteenthLevelBTN" {
                UserDefaults.standard.set(15, forKey: "level")
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "backBTN" {
                self.view?.presentScene(MainMenuScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
        }
    }
}
