//
//  MMLevelSelectMenu.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 11/12/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit


class MMLevelSelectScene:SKScene{
    //Buttons
    var backButton: stdButton!
    let pressedButtonColor:UIColor = .cyan
    
    //Emitters
    var backgroundParticleTwo: SKEmitterNode!
    
    //LevelSelector
    var levelSelector: stdLevelSelector!
    let availableLevels: Array<String> = ["Desert"]
    
    
    override func sceneDidLoad() {
        print("LevelSelectMenu scene has been loaded!")
        
        print("Available levels:")
        for i in 0...(availableLevels.count-1) {
            print("-",availableLevels[i])
        }
    }
    
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = false
        createButtons()
        createBackgroundRain()
        
        createLevelSelector()
    }
    
    func createButtons() {
        let buttonSize: CGSize = CGSize(width: 192*3, height: 18*3)
        let fontSize: CGFloat = CGFloat(162)
        let backButtonScale = CGFloat(0.7)
        
        backButton = stdButton("button1.png", buttonSize: CGSize(width: buttonSize.width/5*4*backButtonScale, height: buttonSize.height*backButtonScale), buttonName: "BACK", fontSize: fontSize*backButtonScale)
        backButton.position = CGPoint(x: self.size.width/2 - buttonSize.width/3*2, y: -self.size.height/2 + fontSize)
        self.addChild(backButton)
    }
    
    
    func createBackgroundRain(){
        backgroundParticleTwo = SKEmitterNode(fileNamed: "MMStarfield_G")
        backgroundParticleTwo.xAcceleration = -10
        self.addChild(backgroundParticleTwo)
    }
    
    
    func createLevelSelector(){
        let levelPictureSize = CGSize(width: 1920/3*2, height: 1080/3*2)
        levelSelector = stdLevelSelector(availableLevels: availableLevels, blockSize: levelPictureSize, name: "LSLevelButton")
        self.addChild(levelSelector)
    }
}
