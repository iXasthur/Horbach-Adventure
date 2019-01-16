//
//  GameMenuScene.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 25/09/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import GameplayKit
//import Foundation

class MainMenuScene: SKScene{
    //Buttons
    var startButton: stdButton!
    var optionsButton: stdButton!
    let pressedButtonColor:UIColor = .cyan
    
    //Levels
    let optionsScene = SKScene(fileNamed: "MMOptionsScene")
    let levelSelectScene = SKScene(fileNamed: "MMLevelSelectScene")
    //let firstLevelScene = SKScene(fileNamed: "GameScene")
    
    //Emitters
    var backgroundParticleStd: SKEmitterNode!
    
//    var backgroundParticleOne: SKEmitterNode!
//    var backgroundParticleTwo: SKEmitterNode!
//    var backgroundParticleThree: SKEmitterNode!
    
    //Pic
    //let backgroundPictureBack: SKSpriteNode = SKSpriteNode(imageNamed: "Clear_Flat Night 4 BG.png")
    //let backgroundPictureFront: SKSpriteNode = SKSpriteNode(imageNamed: "Ground_Flat Night 4 BG.png")
    
    
    
    override func sceneDidLoad() {
        print("Mainmenu scene has been loaded!")
    }
    
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = false
        createButtons()
        createBackgroundRainMax()
        
    }
    
    func createButtons(){
        let buttonSize: CGSize = CGSize(width: 192*3, height: 18*3)
        let fontSize: CGFloat = CGFloat(162)
        
        startButton = stdButton("button1.png", buttonSize: buttonSize, buttonName: "START", fontSize: fontSize)
        startButton.position = CGPoint(x: 0, y: self.size.height/4)
//        startButton.physicsBody = SKPhysicsBody(rectangleOf: buttonSize);
//        startButton.physicsBody?.isDynamic = false
        self.addChild(startButton)
        
        
        optionsButton = stdButton("button1.png", buttonSize: CGSize(width: buttonSize.width/5*7 - 7, height: buttonSize.height), buttonName: "OPTIONS", fontSize: fontSize)
        optionsButton.position = CGPoint(x: startButton.position.x, y: startButton.position.y - fontSize*5/4)
        self.addChild(optionsButton)
        
        
    }
    
    
    func createBackgroundRainMax(){
//        backgroundParticleOne = SKEmitterNode(fileNamed: "MMStarfield_Y")
//        backgroundParticleTwo = SKEmitterNode(fileNamed: "MMStarfield_G")
//        backgroundParticleThree = SKEmitterNode(fileNamed: "MMStarfield_P")
//
//        self.addChild(backgroundParticleOne)
//        self.addChild(backgroundParticleTwo)
//        self.addChild(backgroundParticleThree)
        
        
        backgroundParticleStd = SKEmitterNode(fileNamed: "Starfield")
        backgroundParticleStd.position.y += 500
        
        self.addChild(backgroundParticleStd)
    }
    
//    func createBackgroundRain(){
//        backgroundParticleStd = SKEmitterNode(fileNamed: "Starfield")
//        backgroundParticleStd.position.y += 500
//
//        self.addChild(backgroundParticleStd)
//    }
//
//    func createBackground(){
//        let bgPicSizeScale = CGFloat((self.scene?.size.width)!/backgroundPictureBack.size.width)
//        backgroundPictureBack.size.width = (self.scene?.size.width)!
//        backgroundPictureBack.size.height = backgroundPictureBack.size.height * bgPicSizeScale
//        backgroundPictureFront.size.width = (self.scene?.size.width)!
//        backgroundPictureFront.size.height = backgroundPictureFront.size.height * bgPicSizeScale
//
//
//        backgroundPictureBack.zPosition = -2
//        self.addChild(backgroundPictureBack)
//
//        backgroundPictureFront.zPosition = 0
//        self.addChild(backgroundPictureFront)
//
//        createBackgroundRain()
//    }
    
    
}
