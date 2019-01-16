//
//  GS_Contacts.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 02.04.2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

//import Foundation
import SpriteKit


extension GameScene {


    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == checklayer && contact.bodyB.categoryBitMask == playerGroup && catOnTheGround == false {
            catOnTheGround = true
            
            self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
                self.gamescore+=1
                self.scoreBar.text = String(format: "Score: %04d", self.gamescore)
                }, SKAction.wait(forDuration: TimeInterval(0.3))])), withKey: "IncScore")
            
            
            hero.addCatFire()
        }
        
        if contact.bodyA.categoryBitMask == enemyGroup && contact.bodyB.categoryBitMask == playerGroup {
            if catRespawnTime == false {
                print("Cat has been destroyed")
                catRespawnTime = true
                explodeCat()
                hero.alpha = 0.5
                lifescore-=1
                lifelabel.text = "Life: \(lifescore)"
                
                if lifescore > 0{
                    healthBar.changeHealth(lifescore: lifescore)
                    
//                    if gamescore >= 50{
//                        gamescore-=50
//                    } else {
//                        gamescore = 0
//                    }
                    
                    
                    self.scoreBar.text = String(format: "Score: %04d", self.gamescore)
                    
                    self.run(SKAction.sequence([SKAction.wait(forDuration: 3),SKAction.run {
                        self.catRespawnTime = false
                        self.hero.alpha = 1;
                        }]))
                } else {
                    self.run(SKAction.sequence([SKAction.wait(forDuration: 0.05),SKAction.run {
                        self.exitToMainMenu()
                        }]))
                }
            }
        }
    }

    func didEnd(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == checklayer && contact.bodyB.categoryBitMask == playerGroup && catOnTheGround == true {
            catOnTheGround = false
            
            self.removeAction(forKey: "IncScore")
            
            
            hero.removeCatFire()
        }
    }

}
