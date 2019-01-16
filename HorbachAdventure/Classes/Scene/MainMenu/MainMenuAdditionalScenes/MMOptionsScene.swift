//
//  MMOptionsScene.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 11/12/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit


class MMOptionsScene:SKScene{
    //Buttons
    var backButton: stdButton!
    let pressedButtonColor:UIColor = .cyan
    
    //Emitters
    var backgroundParticleOne: SKEmitterNode!
    
    
    override func sceneDidLoad() {
        print("Options menu scene has been loaded!")
    }
    
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = false
        createButtons()
        createBackgroundRain()
        
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
        backgroundParticleOne = SKEmitterNode(fileNamed: "MMStarfield_Y")
        
        self.addChild(backgroundParticleOne)
    }
}
