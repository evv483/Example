//
//  GameScene.swift
//  SpacegameReloaded
//
//  Created by Training on 01/10/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield:SKEmitterNode!
    var background:SKSpriteNode!
    var player:SKSpriteNode!
    
    let extraLifeSound = SKAction.playSoundFileNamed("ExtraLife", waitForCompletion: false)
    let gameOverSound = SKAction.playSoundFileNamed("GameOver", waitForCompletion: false)
    let hittingDickSound = SKAction.playSoundFileNamed("HittingDick", waitForCompletion: false)
    let hittingRockSound = SKAction.playSoundFileNamed("HittingRock", waitForCompletion: false)
    let winSound = SKAction.playSoundFileNamed("Win", waitForCompletion: false)
    
    var nodePosition = CGPoint()
    var startTouch = CGPoint()
    
    var scoreLabel:SKLabelNode!
    var score:Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)/\(UserDefaults.standard.integer(forKey: "levelScoreToWin"))"
            
            if score > UserDefaults.standard.integer(forKey: "score\(String(UserDefaults.standard.integer(forKey: "level")))level") {
                UserDefaults.standard.set(score, forKey: "score\(String(UserDefaults.standard.integer(forKey: "level")))level")
                
                if score == UserDefaults.standard.integer(forKey: "levelScoreToWin") {
                    UserDefaults.standard.set(true, forKey: "\(String(UserDefaults.standard.integer(forKey: "level")))levelCompleted")
                }
            }            
        }
    }
    
    var playerLivesLabel:SKLabelNode!
    var playerLives:Int = 3 {
        didSet {
            playerLivesLabel.text = "Lives: \(playerLives)"
        }
    }
    
    var pauseBTN:SKSpriteNode!
    var pauseMenuBackground:SKSpriteNode!
    
    var pausedLabel:SKSpriteNode!
    var continueBTN:SKSpriteNode!
    var toMapOfLevelsBTN:SKSpriteNode!
    
    var youWinLabel:SKSpriteNode!
    var nextLevelBTN:SKSpriteNode!

    var gameOverLabel:SKSpriteNode!
    var restartBTN:SKSpriteNode!
    
    enum CollisionType: UInt32 {
        case player = 1
        case object = 2
    }
    
    var timerReachability = Timer()
        
    override func sceneDidLoad() {
        print("sceneDidLoad")
    }
    
    override func willMove(from view: SKView) {
        print("willMove")
    }
    
    override func didMove(to view: SKView) {
                
        let currentScene = SKScene(fileNamed: "GameScene")!
        currentScene.name = "GameScene"
        print("sceneGameScene name: \(currentScene.name!)")
        UserDefaults.standard.set(currentScene.name, forKey: "currentScene")
        
//        view.showsDrawCount = true
        
        print("didMove didMove didMove")
        
        UserDefaults.standard.set(false, forKey: "gamePaused")
        UserDefaults.standard.set(false, forKey: "Win/GameOver Scenario")
        UserDefaults.standard.set(false, forKey: "dismissedToMapOfLevelsAfterPauseMenu")
        UserDefaults.standard.set(false, forKey: "presentReachabilityViewController")

        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            background = SKSpriteNode(imageNamed: "GameLevelBackgroundDark\(String(UserDefaults.standard.integer(forKey: "level")))")
        } else {
                background = SKSpriteNode(imageNamed: "GameLevelBackground\(String(UserDefaults.standard.integer(forKey: "level")))")
            }
        
        background.zPosition = -2
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(background)
        
        player = SKSpriteNode(imageNamed: "playerImage")
        player.name = "1player"
        player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2 + 200)
        player.zPosition = 1
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.contactTestBitMask = CollisionType.object.rawValue
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.usesPreciseCollisionDetection = true
        let xRange = SKRange(lowerLimit: 0, upperLimit: self.frame.size.width)
        let yRange = SKRange(lowerLimit: 0, upperLimit: self.frame.size.height)
        player.constraints = [SKConstraint.positionX(xRange, y: yRange)]
        self.addChild(player)
        
        scoreLabel = SKLabelNode(text: "Score: 0")        
        scoreLabel.zPosition = 1
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.fontSize = 18
        scoreLabel.fontColor = UIColor.white
        score = 0
        
        playerLivesLabel = SKLabelNode(text: "Lives: 3")
        playerLivesLabel.zPosition = 1
        playerLivesLabel.fontName = "AmericanTypewriter-Bold"
        playerLivesLabel.fontSize = 18
        playerLivesLabel.fontColor = UIColor.white
        playerLives = 3
        
        pauseBTN = SKSpriteNode(imageNamed: "pauseBTN")
        pauseBTN.zPosition = 1
        pauseBTN.name = "pauseBTN"
        
        if self.view!.safeAreaInsets.top == 0.0 {
            scoreLabel.position = CGPoint(x: 70, y: self.frame.size.height - 30)
            playerLivesLabel.position = CGPoint(x: 180, y: self.frame.size.height - 30)
            pauseBTN.position = CGPoint(x: self.frame.size.width - 40, y: self.frame.size.height - 40 )
        } else {
            scoreLabel.position = CGPoint(x: 70, y: self.frame.size.height - 60)
            playerLivesLabel.position = CGPoint(x: 180, y: self.frame.size.height - 60)
            pauseBTN.position = CGPoint(x: self.frame.size.width - 60, y: self.frame.size.height - 60 )
        }
        
        self.addChild(playerLivesLabel)
        self.addChild(scoreLabel)
        self.addChild(pauseBTN)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(randomAddObject),SKAction.wait(forDuration: UserDefaults.standard.double(forKey: "SKActionDuration"))])))
        
        NotificationCenter.default.addObserver(self, selector: #selector(isPausedFalse), name: NSNotification.Name(rawValue:"isPausedFalse"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(isPausedTrue), name: NSNotification.Name(rawValue:"isPausedTrue"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(toMapOfLevels), name: NSNotification.Name(rawValue:"toMapOfLevels"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.presentMainMenuScene), name: NSNotification.Name(rawValue:"presentMainMenuScene"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.timerReachabilityInvalidate), name: NSNotification.Name(rawValue:"timerReachabilityInvalidate"), object: nil)

        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            if UserDefaults.standard.bool(forKey: "presentReachabilityViewController") == false {
                print("GameScene didMove presentReachabilityViewController false")
                
                timerReachability = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                                    checkReachability()
                }
            } else {
                print("GameScene didMove presentReachabilityViewController true")
            }
        }
    }
    
    func randomAddObject() {
        
        let randomNumber = Int.random(in: 0...20)
        
        if randomNumber >= 0 && randomNumber <= 9 {
            addObject1()
        } else if randomNumber == 10 {
            addObject2()
        } else if randomNumber > 10 && randomNumber <= 20 {
            addObject3()
        }
    }
    
    @objc func presentMainMenuScene() {
        timerReachability.invalidate()
        self.view?.presentScene(MainMenuScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
    }
    
    @objc func appMovedToBackground() {
        UserDefaults.standard.set(false, forKey: "dismissedToMapOfLevelsAfterPauseMenu")

        if UserDefaults.standard.bool(forKey: "appMovedToBackground") == false {
            UserDefaults.standard.set(true, forKey: "appMovedToBackground")
            print("App moved to background!")
            UserDefaults.standard.set(false, forKey: "didBecomeActive")
        }
    }
    
    @objc func didBecomeActive() {
        self.isPaused = true
        
//        Ниже следует целая вермишель, за которую мне стыдно) но за разумное время я не смог реализовать задачу иначе. Мне необходимо было реализовать остановку игры и презентацию лейбла что игра на паузе, в случае если пользователь свернул приложение во время игры и открыл позже. Почему то метод didBecomeActive вызывается иногда несколько раз, изза чего возникали трудности в многократном добавлении лейбла. Далее необходимо было исключить сценарий представления лейбла "Пауза", если на экране лейбл "Выиграл/Проиграл". Далее необходимо было исключить сценарий представления лейбла "Пауза", если на экране уже есть лейбл "Пауза". А далее необходимо было исключить сценарий представления лейбла "Пауза", если представлена другая сцена (почему то бывало и такое).
        
        if UserDefaults.standard.bool(forKey: "didBecomeActive") == false {
            UserDefaults.standard.set(true, forKey: "didBecomeActive")
            print("App become active!")
            if UserDefaults.standard.bool(forKey: "Win/GameOver Scenario") == false {
                print("Win/GameOver Scenario \(UserDefaults.standard.bool(forKey: "Win/GameOver Scenario"))")
                print("gamePaused \(UserDefaults.standard.bool(forKey: "gamePaused"))")
                if UserDefaults.standard.bool(forKey: "gamePaused") == false {
                    if UserDefaults.standard.string(forKey: "currentScene") == "GameScene" {
                        print("GameScene did become active gamePaused false")
                        UserDefaults.standard.set(true, forKey: "gamePaused")
                        self.isPaused = true
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentPauseMenu"), object:nil)
                    }
                }
            }
        }
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            if UserDefaults.standard.bool(forKey: "presentReachabilityViewController") == false {
                print("NOT PURCHASED")
                
                    timerReachability = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                                        checkReachability()
                    }
                } else {
                    print("checkReachability PURCHASED")
                }
        }
        
        UserDefaults.standard.set(false, forKey: "appMovedToBackground")
    }
    
    @objc func isPausedFalse() {
        print("isPausedFalse")
        self.isPaused = false
    }
    
    @objc func isPausedTrue() {
        print("isPausedTrue")
        self.isPaused = true
    }
    
    @objc func toMapOfLevels() {
        self.view?.presentScene(MapOfLevels(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
    }
    
    @objc func timerReachabilityInvalidate() {
        timerReachability.invalidate()
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let location = touches.first?.location(in: self){
            startTouch = location
            nodePosition = player.position
            
            if self.nodes(at: location).first?.name == "pauseBTN" {
                self.isPaused = true
                print("isPausedTrue")
                UserDefaults.standard.set(true, forKey: "gamePaused")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentPauseMenu"), object:nil)
            }
            
            if self.nodes(at: location).first?.name == "toMapOfLevelsBTN" {
                UserDefaults.standard.set(false, forKey: "didBecomeActive")
                UserDefaults.standard.set(false, forKey: "appMovedToBackground")
                timerReachability.invalidate()
                self.view?.presentScene(MapOfLevels(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if self.nodes(at: location).first?.name == "restartBTN" {
                UserDefaults.standard.set(false, forKey: "didBecomeActive")
                UserDefaults.standard.set(false, forKey: "appMovedToBackground")
                timerReachability.invalidate()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
            
            if self.nodes(at: location).first?.name == "nextLevelBTN" {
                UserDefaults.standard.set(false, forKey: "didBecomeActive")
                UserDefaults.standard.set(false, forKey: "appMovedToBackground")
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "level")+1, forKey: "level")
                timerReachability.invalidate()
                nextLevel()
                self.view?.presentScene(GameScene(size: self.size), transition: .flipHorizontal(withDuration: 0.5))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            player.run(SKAction.move(to: CGPoint(x: nodePosition.x + location.x - startTouch.x, y: nodePosition.y + location.y - startTouch.y), duration: 0))
        }
    }
    
    func addObject1() {

//        print("addObject1 addObject1 addObject1")
    
        let arrayNodeName1 = UserDefaults.standard.array(forKey: "LevelObjects1")!.randomElement()! as! String
    
        let object1 = SKSpriteNode(imageNamed: arrayNodeName1)

        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width))
        let position = CGFloat(randomPosition.nextInt())

        object1.name = "object1"
        object1.position = CGPoint(x: position, y: self.frame.size.height + object1.size.height / 2)
        object1.physicsBody = SKPhysicsBody(circleOfRadius: object1.size.width / 2)
        object1.physicsBody?.isDynamic = true

        object1.physicsBody?.categoryBitMask = CollisionType.object.rawValue
        object1.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        object1.physicsBody?.collisionBitMask = 0

        let animationDuration:TimeInterval = Double.random(in: UserDefaults.standard.double(forKey: "animationDurationObject1Min")...UserDefaults.standard.double(forKey: "animationDurationObject1Max"))
        
        let actionMove = SKAction.move(to: CGPoint(x: position, y: -object1.size.height),
                                         duration: TimeInterval(animationDuration))
        let actionMoveDone = SKAction.removeFromParent()
        object1.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        self.addChild(object1)
    }
    
    func addObject2() {
            
        print("addObject2 addObject2 addObject2")
        
        let arrayNodeName2 = UserDefaults.standard.array(forKey: "LevelObjects2")!.randomElement()! as! String
        
        let object2 = SKSpriteNode(imageNamed: arrayNodeName2)
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width))
        let position = CGFloat(randomPosition.nextInt())
        
        object2.name = "object2"
        object2.position = CGPoint(x: position, y: self.frame.size.height + object2.size.height)
        
        object2.physicsBody = SKPhysicsBody(circleOfRadius: object2.size.width / 2)
        object2.physicsBody?.isDynamic = true
        
        object2.physicsBody?.categoryBitMask = CollisionType.object.rawValue
        object2.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        object2.physicsBody?.collisionBitMask = 0

        let animationDuration: TimeInterval = Double.random(in: UserDefaults.standard.double(forKey: "animationDurationObject2Min")...UserDefaults.standard.double(forKey: "animationDurationObject2Max"))
                
        let actionMove = SKAction.move(to: CGPoint(x: position, y: -object2.size.height),
                                             duration: TimeInterval(animationDuration))
        let actionMoveDone = SKAction.removeFromParent()
        object2.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        self.addChild(object2)
    }
    
    func addObject3() {
        
        let arrayNodeName3 = UserDefaults.standard.array(forKey: "LevelObjects3")!.randomElement()! as! String
        
        let object3 = SKSpriteNode(imageNamed: arrayNodeName3)

        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width))
        let position = CGFloat(randomPosition.nextInt())
        
//        print(arrayNodeName3)

        object3.name = "object3"
        object3.position = CGPoint(x: position, y: self.frame.size.height + object3.size.height)
        object3.physicsBody = SKPhysicsBody(circleOfRadius: object3.size.width / 2)
        object3.physicsBody?.isDynamic = true
        object3.physicsBody?.categoryBitMask = CollisionType.object.rawValue
        object3.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        object3.physicsBody?.collisionBitMask = 0
        
        if arrayNodeName3 == "blueBALLS" || arrayNodeName3 ==  "pinkBALLS" || arrayNodeName3 ==  "pinkDoubleSidePlaneBallsDLD" || arrayNodeName3 ==  "purpleDoubleSideRoundedDLD" || arrayNodeName3 ==  "skinDoubleSidePlaneDLD" {
            object3.run(SKAction.repeatForever(SKAction.rotate(byAngle: 5, duration: 2)))
        }
        
        let animationDuration: TimeInterval = Double.random(in: UserDefaults.standard.double(forKey: "animationDurationObject3Min")...UserDefaults.standard.double(forKey: "animationDurationObject3Max"))
        let actionMove = SKAction.move(to: CGPoint(x: position, y: -object3.size.height),
                                             duration: TimeInterval(animationDuration))
        let actionMoveDone = SKAction.removeFromParent()
        object3.run(SKAction.sequence([actionMove, actionMoveDone]))
            
        self.addChild(object3)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }

        let sortedNodes = [nodeA, nodeB].sorted { $0.name ?? "" < $1.name ?? "" }
        let firstNode = sortedNodes[0]
        let secondNode = sortedNodes[1]
        
        if firstNode.name == "1player" {
//            print("1player1player1player")
        }
        
        if secondNode.name == "object1" {
            run(hittingRockSound)
            if playerLives > 1 {
                vibro01()
//                print("Object1 Object1 Object1")
                secondNode.removeFromParent()
                playerLives -= 1
            } else {
                vibro01()
//                print("Object1 Object1 Object1")
                secondNode.removeFromParent()
                playerLives -= 1
                gameOver()
            }
        }
        
        if secondNode.name == "object2" {
            run(extraLifeSound)

//            print("object2")
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            secondNode.removeFromParent()
            playerLives += 1
        }
        
        if secondNode.name == "object3" {
            run(hittingDickSound)

//            print("object3 object3 object3")
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()

            secondNode.removeFromParent()
            score += 1
            
            if score == UserDefaults.standard.integer(forKey: "levelScoreToWin") {
                youWin()
            }
        }
    }
    
    func youWin() {
        run(winSound)

        UserDefaults.standard.set(true, forKey: "Win/GameOver Scenario")
        
        player.removeFromParent()
        scoreLabel.removeFromParent()
        playerLivesLabel.removeFromParent()
        pauseBTN.removeFromParent()
        
        youWinLabel = SKSpriteNode(imageNamed: "youWinLabel")
        youWinLabel.name = "youWinLabel"
        youWinLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 + 120)
        youWinLabel.zPosition = 3
        self.addChild(youWinLabel)
        
        nextLevelBTN = SKSpriteNode(imageNamed: "nextLevelBTN")
        nextLevelBTN.name = "nextLevelBTN"
        nextLevelBTN.position = CGPoint(x: self.size.width / 2, y: youWinLabel.position.y - 188.5)
        nextLevelBTN.zPosition = 3
        self.addChild(nextLevelBTN)
        
        toMapOfLevelsBTN = SKSpriteNode(imageNamed: "toMapOfLevelsBTN")
        toMapOfLevelsBTN.name = "toMapOfLevelsBTN"
        toMapOfLevelsBTN.position = CGPoint(x: self.size.width / 2, y: nextLevelBTN.position.y - 100)
        toMapOfLevelsBTN.zPosition = 3
        self.addChild(toMapOfLevelsBTN)
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentShowAdViewController"), object:nil)
            }
        }
    }
    
    func gameOver() {
        run(gameOverSound)

        UserDefaults.standard.set(true, forKey: "Win/GameOver Scenario")

        if let explosion = SKEmitterNode(fileNamed: "Explosion") {
            explosion.position = player.position
            addChild(explosion)
        }
        
        player.removeFromParent()
        scoreLabel.removeFromParent()
        playerLivesLabel.removeFromParent()
        pauseBTN.removeFromParent()

        gameOverLabel = SKSpriteNode(imageNamed: "gameOverLabel")
        gameOverLabel.name = "gameOverLabel"
        gameOverLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 + 120)
        gameOverLabel.zPosition = 3
        self.addChild(gameOverLabel)
        
        restartBTN = SKSpriteNode(imageNamed: "restartBTN")
        restartBTN.name = "restartBTN"
        restartBTN.position = CGPoint(x: self.size.width / 2, y: gameOverLabel.position.y - 188.5)
        restartBTN.zPosition = 3
        self.addChild(restartBTN)
        
        toMapOfLevelsBTN = SKSpriteNode(imageNamed: "toMapOfLevelsBTN")
        toMapOfLevelsBTN.name = "toMapOfLevelsBTN"
        toMapOfLevelsBTN.position = CGPoint(x: self.size.width / 2, y: restartBTN.position.y - 100)
        toMapOfLevelsBTN.zPosition = 3
        self.addChild(toMapOfLevelsBTN)
        
        if UserDefaults.standard.bool(forKey: "Purchase") == false {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"presentShowAdViewController"), object:nil)
            }
        }
    }
}
