//
//  Background.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 27/09/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class backGround:SKSpriteNode{
    
    
    init(_ textureName: String){
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        
        //-----TexturePosition-----
        self.position = CGPoint(x: -300, y: 30) //stdPos
        self.zPosition = -2;
        
        
        //-----AdditionalTextures-----
        let addBackGround1 = SKSpriteNode(texture: texture)
        addBackGround1.position = CGPoint(x: self.size.width, y: 0)
        self.addChild(addBackGround1)
        
        let addBackGround2 = SKSpriteNode(texture: texture)
        addBackGround2.position = CGPoint(x: self.size.width, y: 0)
        addBackGround1.addChild(addBackGround2)
        
        
        //-----Animation-----
        let moveLeft = SKAction.moveBy(x: -self.size.width, y: 0, duration: 200)
        let replaceBg = SKAction.moveBy(x: self.size.width, y: 0, duration: 0)
        let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveLeft, replaceBg]))
        self.run(moveBgForever)
    }
    
    
    
    func increaseSpeed(speedScale: CGFloat){
        self.speed = speedScale
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
