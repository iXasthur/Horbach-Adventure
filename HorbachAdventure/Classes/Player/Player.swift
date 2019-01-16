//
//  Player.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 27/09/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit


class player:SKSpriteNode {
    var netherFire: SKEmitterNode!
    
    init(_ imageArrayName: String, _ size: CGSize, tpfValue: TimeInterval){
        
        var playerTexture = SKTextureAtlas()
        var playerTextureArray = [SKTexture]()
        
        
        
        //-----AnimationArray-----
        playerTexture = SKTextureAtlas(named: imageArrayName)
        if imageArrayName == "BlackCat+"{
            for i in 1...playerTexture.textureNames.count{
                let Name = "bc\(i).png"
                playerTextureArray.append(SKTexture(imageNamed: Name))
            }
        } else
            if imageArrayName == "BlackCat+HD"{
                for i in 1...playerTexture.textureNames.count{
                    let Name = "HDbc\(i).png"
                    playerTextureArray.append(SKTexture(imageNamed: Name))
                }
        }
        //------------------------
        
        let texture: SKTexture = SKTexture(imageNamed: playerTexture.textureNames[0])
        
        super.init(texture: texture, color: .clear, size: size)
        
        self.zPosition = 0
        
        
        //-----PhysicsBody-----
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height/2, center: CGPoint(x: 20, y: 0))
        self.physicsBody?.density = 1.6 //for BlackCat
        self.physicsBody?.isDynamic = true
        

        //-----AnimationRun-----
        self.run(SKAction.repeatForever(SKAction.animate(with: playerTextureArray, timePerFrame: tpfValue)))
        
        //-----CatEmitters-----
        createCatFire()
    }
    


    func increaseSpeed(speedScale: CGFloat){
        self.speed = speedScale
    }
    
    
    func createCatFire(){
        netherFire = SKEmitterNode(fileNamed: "Fire")
        netherFire.particleBirthRate = 0
        netherFire.zPosition = 0
        netherFire.position = CGPoint(x: -25 , y: 20)
        self.addChild(netherFire)
    }
    
    func addCatFire(){
        netherFire.particleBirthRate = 100
    }
    
    func removeCatFire(){
        netherFire.particleBirthRate = 0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
