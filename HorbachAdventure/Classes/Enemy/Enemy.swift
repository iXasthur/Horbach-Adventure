//
//  Enemy.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 30/09/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class enemy:SKSpriteNode{

    init(_ imageArrayName: String, _ size: CGSize, tpfValue: TimeInterval){
        
        var enemyTexture = SKTextureAtlas()
        var enemyTextureArray = [SKTexture]()
        
        
        //-----AnimationArray-----
        enemyTexture = SKTextureAtlas(named: imageArrayName)
        if imageArrayName == "WolfEnemy+b" {
            for i in 1...enemyTexture.textureNames.count{
                let Name = "wolf\(i).png"
                enemyTextureArray.append(SKTexture(imageNamed: Name))
            }
        } else
            if imageArrayName == "WolfEnemy+y"{
                for i in 1...enemyTexture.textureNames.count{
                    let Name = "ywolf\(i).png"
                    enemyTextureArray.append(SKTexture(imageNamed: Name))
                }
            } else
                if imageArrayName == "EagleEnemy"{
                    for i in 1...enemyTexture.textureNames.count-6{
                        let Name = "FStableBirdEagle_\(i).png"
                        enemyTextureArray.append(SKTexture(imageNamed: Name))
                    }
                } else
                    if imageArrayName == "EagleEnemy+HD" {
                        for i in 1...enemyTexture.textureNames.count{
                            let Name = "HDBirdEagle\(i).png"
                            enemyTextureArray.append(SKTexture(imageNamed: Name))
                        }
                    }
        
        //------------------------

        let texture: SKTexture = SKTexture(imageNamed: enemyTexture.textureNames[0])
        
        super.init(texture: texture, color: .clear, size: size)
        
        self.zPosition = 0
        
        if (imageArrayName == "WolfEnemy+b") || (imageArrayName == "WolfEnemy+y"){
            self.position = CGPoint(x: 1218 + self.size.width, y: -self.size.height)
            self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height/2, center: CGPoint(x: -self.size.width/4, y: 0))
            self.physicsBody?.density = 1.4
            self.physicsBody?.isDynamic = true
            
            self.run(SKAction.repeatForever(SKAction.moveBy(x: -self.size.width, y: 0, duration: 0.5)))
        } else if (imageArrayName == "EagleEnemy") || (imageArrayName == "EagleEnemy+HD") {
                self.position = CGPoint(x: 1218 + self.size.width, y: self.size.height/2)
                self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height/7, center: CGPoint(x: -self.size.width/4 + 10, y: 0))
                //self.physicsBody?.density
                self.physicsBody?.isDynamic = false
            
                self.run(SKAction.repeatForever(SKAction.moveBy(x: -self.size.width, y: 0, duration: 0.3)))
        }
        
        
        self.run(SKAction.repeatForever(SKAction.animate(with: enemyTextureArray, timePerFrame: tpfValue)))
    }
    
    
    func increaseSpeed(speedScale: CGFloat){
        self.speed = 1 + speedScale/10
    }
    
    
    func respawnEnemy(){
        self.position = CGPoint(x: 1218 + self.size.width*2, y: -self.size.height)
    }
    
    func respawnEnemyBird(){
        self.position = CGPoint(x: 1218 + self.size.width*2, y: self.size.height/2)
    }
    
    func respawnEnemyBirdByPos(respawnYPos: CGFloat){
        if respawnYPos <= 150{
            self.position = CGPoint(x: 1218 + self.size.width*2, y: CGFloat.random(in: 150...((self.scene?.size.height)! - self.size.height)/2))
        } else {
            self.position = CGPoint(x: 1218 + self.size.width*2, y: respawnYPos)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
