//
//  GameScene.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 01.04.2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import GameplayKit
//import Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    //Settings
    var gameSpeed: CGFloat = 1
    var speedUpdateTime: TimeInterval = 1
    var debugInfoShown: Bool = showDeveloperInfo
    
    //Objects
    var hero: player!
    var floor: ground!
    var background: backGround!
    var wolfBrown: enemy!
    var wolfYellow: enemy!
    var birdEagle: enemy!
    var healthBar: health!
    var scoreBar: stdLabel!
    
    //Behavior
    var jumped: Bool = false
    var catOnTheGround: Bool = false
    var catRespawnTime: Bool = false
    
    
    //PhysicsBodies
    let playerGroup: UInt32 = 0x1 << 1
    let groundGroup: UInt32 = 0x1 << 2
    let checklayer: UInt32 = 0x1 << 3
    let enemyGroup: UInt32 = 0x1 << 4
    let solidGround = SKNode()
    let checkGround = SKNode()
    let solidSky = SKNode()
    
    //Emitters
    var bgRain: SKEmitterNode!
    var bgDesertFlow: SKEmitterNode!
    var explosion: SKEmitterNode!
    
    //Time
    var t1 = 0
    var t2 = 0
    var t3 = 0
    
    //TextButtons
    var lifelabel: SKLabelNode!
    var pause: SKLabelNode!
    var time: SKLabelNode!
    var debugInfo: SKLabelNode!
    var buttonPlusGameSpeed: SKLabelNode!
    var buttonMinusGameSpeed: SKLabelNode!
    var buttonResetGameSpeed: SKLabelNode!
    var gameSpeedLabel: SKLabelNode!
    
    //DefaultValues
    var lifescore = 4
    var gamescore = 0
    
    //Actions
    

    override func sceneDidLoad() {
        print("GameScene(Desert) has been loaded!")
    }
    
    
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.view?.isMultipleTouchEnabled = true
        
        createGround()
        createBackground()
        createDesertFlow()
        
        createEnemy()
        createPlayer()
        
        createTime()
        createLifeLabel()
        createPause()
        createScoreLabel()
        createDebugInfo()
        createGameDeveloperSettings()
        
        //-----GameSpeedScaling-----
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: TimeInterval(speedUpdateTime)),SKAction.run(speedScale)])))
        
        //-----AddHealthEvery20Sec-----
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: TimeInterval(20)),SKAction.run {
                self.lifescore+=1
                self.lifelabel.text = "Life: \(self.lifescore)"
                self.healthBar.changeHealth(lifescore: self.lifescore)
            }])))
    }




    //-----------------PLAYER------------------------
    func createPlayer(){
        let catSize = CGSize(width: 500/5*2, height: 396/5*2)
        hero = player("BlackCat+", catSize, tpfValue: 0.8)

        hero.position = CGPoint(x: -550, y: 0)
        hero.physicsBody?.collisionBitMask = groundGroup
        hero.physicsBody?.categoryBitMask = playerGroup
        hero.physicsBody?.contactTestBitMask = enemyGroup
        hero.physicsBody?.allowsRotation = false

        self.addChild(hero)
        
        createCatExplosion()
    }
    
    func createCatExplosion(){
        explosion = SKEmitterNode(fileNamed: "Explosion")
        explosion.particleBirthRate = 0
        self.addChild(explosion)
    }
    
    func explodeCat(){
        explosion.particleBirthRate = 2000
        explosion.position = hero.position
        explosion.resetSimulation()
    }

    
    
    //----------------------ENEMY----------------------
    func infinityEnemy(){
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: TimeInterval(0.1)),SKAction.run(enemyBehavior)])))
    }
    
//    func infinityEnemy(){
//        DispatchQueue.global(qos: .userInitiated).async{
//            self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: TimeInterval(0.1)),SKAction.run(self.enemyBehavior)])))
//        }
//    }
    
    func enemyBehavior(){
        
        if wolfBrown.position.x < -self.size.width {
            wolfBrown.respawnEnemy()
            jumped = false
            if Int.random(in: 0...1) == 1{
                wolfBrown.physicsBody?.velocity = CGVector.zero
                wolfBrown.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -1200...0), dy: Int.random(in: 0...1000)))
            }
        } else if abs(wolfBrown.position.x - hero.position.x)<1000 && abs(wolfBrown.position.x - hero.position.x)>800 && wolfBrown.position.x > hero.position.x && abs(wolfBrown.position.y - floor.position.y)<50 && jumped == false && Int.random(in: 0...4)==1 {
            wolfBrown.physicsBody?.applyImpulse(CGVector(dx: 0, dy: Int.random(in: 800...1200)))
            jumped = true
        } else if abs(wolfBrown.position.x - hero.position.x)<500 && wolfBrown.position.x > hero.position.x && abs(wolfBrown.position.x - hero.position.x)>abs(hero.position.y - floor.position.y) && abs(wolfBrown.position.y - hero.position.y)>50 && abs(wolfBrown.position.y - floor.position.y)<50 && jumped == false && Int.random(in: 0...1)==1 {
            wolfBrown.physicsBody?.applyImpulse(CGVector(dx: 0, dy: Int.random(in: 800...1200)))
            jumped = true
        }
        
        
        if wolfYellow.position.x < -self.size.width{
            wolfYellow.respawnEnemy()
            if Int.random(in: 0...1) == 1{
                wolfYellow.physicsBody?.velocity = CGVector.zero
                wolfYellow.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -2400...0), dy: Int.random(in: 0...3000)))
            }
        }
        
        if birdEagle.position.x < -self.size.width{
            birdEagle.respawnEnemyBirdByPos(respawnYPos: hero.position.y)
            
            
        }
        
    }
    
    
    func createEnemy(){
        let wolfSizeBrown = CGSize(width: 500/3*2, height: 254/3*2)
        let wolfSizeYellow = CGSize(width: 500, height: 254)
        let eagleSize = CGSize(width: 700/2, height: 700/2)
        
        wolfBrown = enemy("WolfEnemy+b", wolfSizeBrown, tpfValue: 0.1)
        wolfYellow = enemy("WolfEnemy+y", wolfSizeYellow, tpfValue: 0.1)
        birdEagle = enemy("EagleEnemy+HD", eagleSize, tpfValue: 0.1)
        
        wolfBrown.physicsBody?.collisionBitMask = groundGroup
        wolfYellow.physicsBody?.collisionBitMask = groundGroup
        birdEagle.physicsBody?.collisionBitMask = groundGroup
        
        wolfBrown.physicsBody?.categoryBitMask = enemyGroup
        wolfYellow.physicsBody?.categoryBitMask = enemyGroup
        birdEagle.physicsBody?.categoryBitMask = enemyGroup
        
        wolfBrown.physicsBody?.allowsRotation = false
        wolfYellow.physicsBody?.allowsRotation = false
        birdEagle.physicsBody?.allowsRotation = false

        
        self.addChild(birdEagle)
        self.addChild(wolfBrown)
        self.addChild(wolfYellow)
        
        
        infinityEnemy()
    }
    
    
    //-----------------BACKGROUND------------------------
    func createBackground(){
        background = backGround("Desert.png")
        self.addChild(background)
    }
    
    
    //-----------------PARTICLES------------------------
    func createRain(){
        bgRain = SKEmitterNode(fileNamed: "MyRain")
        bgRain.position = CGPoint(x: 0 , y: 700)
        self.addChild(bgRain)
        bgRain.zPosition = -1;
    }
    
    
    func createDesertFlow(){
        bgDesertFlow = SKEmitterNode(fileNamed: "MyRain+")
        bgDesertFlow.position = CGPoint(x: 700 , y: 200)
        self.addChild(bgDesertFlow)
        bgDesertFlow.zPosition = -1;
    }
    
    
    //-----------------FLOOR+SKY------------------------
    func createGround(){
        floor = ground("Grass+y.png")
        self.addChild(floor)
        
        createSolidGround()
        createSolidSky()
        createCheckFloorLayer()
    }

    
    func createSolidGround(){
        solidGround.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width*3, height: floor.size.height/4))
        solidGround.zPosition = 0
        solidGround.position = CGPoint(x: 0, y: -410)
        solidGround.physicsBody?.isDynamic = false
        solidGround.physicsBody?.categoryBitMask = groundGroup
        self.addChild(solidGround)
    }
    
    
    func createSolidSky(){
        solidSky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: 50))
        solidSky.physicsBody?.categoryBitMask = groundGroup
        solidSky.physicsBody?.isDynamic = false
        solidSky.position = CGPoint(x: 0, y: self.size.height/2 + 25)
        solidSky.zPosition = 0
        self.addChild(solidSky)
    }
    
    
    
    func createCheckFloorLayer(){
        checkGround.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: floor.size.height/4))
        checkGround.physicsBody?.categoryBitMask = checklayer
        checkGround.physicsBody?.contactTestBitMask = playerGroup
        checkGround.physicsBody?.isDynamic = false
        checkGround.position = CGPoint(x: 0, y: -380)
        checkGround.zPosition = 0
        self.addChild(checkGround)
    }
    


    //-----------------SCALING------------------------
    func speedScale(){
        gameSpeed+=0.02
        gameSpeedLabel.text = "Game Speed: \(NSString(format:"%.2f", gameSpeed))"
        
        //Hero
        hero.increaseSpeed(speedScale: gameSpeed)
        //Terrain
        floor.increaseSpeed(speedScale: gameSpeed)
        //Background
        background.increaseSpeed(speedScale: gameSpeed)
        //Enemies
        wolfBrown.increaseSpeed(speedScale: gameSpeed)
        wolfYellow.increaseSpeed(speedScale: gameSpeed)
        birdEagle.increaseSpeed(speedScale: gameSpeed)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
