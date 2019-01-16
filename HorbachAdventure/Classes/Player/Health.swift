//
//  Health.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 04/10/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class health:SKSpriteNode{
    var healthUnit2: SKSpriteNode?
    var healthUnit3: SKSpriteNode?
    var healthUnit4: SKSpriteNode?
    var healthUnit5: SKSpriteNode?
    var additionalHealth: stdLabel?
    
    
    init(_ textureName: String, startHealth: Int){
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        
        super.init(texture: texture, color: .clear, size: CGSize(width: 100, height: 100))
        
        self.zPosition = 4
        
        healthUnit2 = SKSpriteNode(texture: self.texture, size: self.size)
        healthUnit3 = SKSpriteNode(texture: self.texture, size: self.size)
        healthUnit4 = SKSpriteNode(texture: self.texture, size: self.size)
        healthUnit5 = SKSpriteNode(texture: self.texture, size: self.size)
        additionalHealth = stdLabel(name: "healthT", text: "+1", fontSize: 81, isHidden: false)
        
        healthUnit2?.position = CGPoint(x: self.position.x + self.size.width, y: self.position.y)
        healthUnit3?.position = CGPoint(x: healthUnit2!.position.x + self.size.width, y: self.position.y)
        healthUnit4?.position = CGPoint(x: healthUnit3!.position.x + self.size.width, y: self.position.y)
        healthUnit5?.position = CGPoint(x: healthUnit4!.position.x + self.size.width, y: self.position.y)
        additionalHealth?.position = CGPoint(x: healthUnit5!.position.x + self.size.width/3*2, y: self.position.y - self.size.height/4)
        additionalHealth?.horizontalAlignmentMode = .left
        
        self.addChild(healthUnit2!)
        self.addChild(healthUnit3!)
        self.addChild(healthUnit4!)
        self.addChild(healthUnit5!)
        self.addChild(additionalHealth!)
        
        changeHealth(lifescore: startHealth)
    }
    
    func changeHealth(lifescore: Int){
        if lifescore == 1 {
            healthUnit2?.isHidden = true
            healthUnit3?.isHidden = true
            healthUnit4?.isHidden = true
            healthUnit5?.isHidden = true
            additionalHealth?.isHidden = true
        } else
            if lifescore == 2 {
                healthUnit2?.isHidden = false
                healthUnit3?.isHidden = true
                healthUnit4?.isHidden = true
                healthUnit5?.isHidden = true
                additionalHealth?.isHidden = true
            } else
                if lifescore == 3 {
                    healthUnit2?.isHidden = false
                    healthUnit3?.isHidden = false
                    healthUnit4?.isHidden = true
                    healthUnit5?.isHidden = true
                    additionalHealth?.isHidden = true
                } else
                    if lifescore == 4 {
                        healthUnit2?.isHidden = false
                        healthUnit3?.isHidden = false
                        healthUnit4?.isHidden = false
                        healthUnit5?.isHidden = true
                        additionalHealth?.isHidden = true
                    } else
                        if lifescore == 5 {
                            healthUnit2?.isHidden = false
                            healthUnit3?.isHidden = false
                            healthUnit4?.isHidden = false
                            healthUnit5?.isHidden = false
                            additionalHealth?.isHidden = true
                        } else
                            if lifescore >= 6 {
                                healthUnit2?.isHidden = false
                                healthUnit3?.isHidden = false
                                healthUnit4?.isHidden = false
                                healthUnit5?.isHidden = false
                                additionalHealth?.isHidden = false
                                additionalHealth?.text = "+\(lifescore - 5)"
                            }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
