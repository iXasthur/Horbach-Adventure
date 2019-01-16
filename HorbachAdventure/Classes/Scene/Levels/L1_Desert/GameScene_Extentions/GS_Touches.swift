//
//  GS_Touches.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 02.04.2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

//import Foundation
import SpriteKit


extension GameScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "pause" && self.isPaused == false  {
                self.isPaused = true
                pause.text = "Resume"
                debugInfo.isHidden = false
            } else
                if atPoint(location).name == "pause" && self.isPaused == true {
                    self.isPaused = false
                    pause.text = "Pause"
                    debugInfo.isHidden = true
            } else
                if self.isPaused == false {
                    hero.physicsBody?.velocity = CGVector.zero
                    hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 850))
                }
        
            
            if atPoint(location).name == "debugInfo" {
                if debugInfoShown == false {
                    debugInfoShown = true
                    debugInfo.text = "Hide Debug Info"
                    
                    buttonPlusGameSpeed.isHidden = false
                    buttonMinusGameSpeed.isHidden = false
                    buttonResetGameSpeed.isHidden = false
                    gameSpeedLabel.isHidden = false
                    lifelabel.isHidden = false
                    
                    view?.showsFPS = true
                    view?.showsNodeCount = true
                    view?.showsPhysics = true
                } else {
                    debugInfoShown = false
                    debugInfo.text = "Show Debug Info"
                  
                    buttonPlusGameSpeed.isHidden = true
                    buttonMinusGameSpeed.isHidden = true
                    buttonResetGameSpeed.isHidden = true
                    gameSpeedLabel.isHidden = true
                    lifelabel.isHidden = true
                    
                    view?.showsFPS = false
                    view?.showsNodeCount = false
                    view?.showsPhysics = false
                }
            }
            
            
            if atPoint(location).name == "buttonPlusGameSpeed" {
                gameSpeed+=1;
            }
            
            if atPoint(location).name == "buttonMinusGameSpeed" {
                gameSpeed-=1;
            }
            
            if atPoint(location).name == "buttonResetGameSpeed" {
                gameSpeed = 1;
                lifescore = 3
                gamescore = 0
                scoreBar.text = String(format: "Score: %04d", gamescore)
                lifelabel.text = "Life: \(lifescore)"
                gameSpeedLabel.text = "Game Speed: \(gameSpeed)"
                healthBar.changeHealth(lifescore: lifescore)
            }
            
   
        }
    }
    
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//
//            }
//    }
}
