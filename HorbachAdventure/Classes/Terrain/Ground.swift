//
//  Ground.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 27/09/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class ground:SKSpriteNode{
    
    
    init(_ textureName: String){
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        
        super.init(texture: texture, color: .clear, size: texture.size())


        //-----TexturePosition-----
        self.position = CGPoint(x: -self.size.width/4 - 300, y: -self.size.height/8*3 - 10) //stdPos
        self.zPosition = 1;
        
        
        //-----AdditionalTextures-----
        let addGround1 = SKSpriteNode(texture: texture)
        let addGround2 = SKSpriteNode(texture: texture)
        addGround1.position = CGPoint(x: self.size.width, y: 0)
        self.addChild(addGround1)
        addGround2.position = CGPoint(x: self.size.width, y: 0)
        addGround1.addChild(addGround2)

        
        //-----Animation-----
        let moveLeft = SKAction.moveBy(x: -self.size.width, y: 0, duration: 15)
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
