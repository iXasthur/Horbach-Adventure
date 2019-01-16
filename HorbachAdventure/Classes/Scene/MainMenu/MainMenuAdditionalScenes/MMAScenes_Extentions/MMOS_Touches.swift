//
//  MMOS_Touches.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 11/12/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit

extension MMOptionsScene{
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            
            if atPoint(location).name == "BACK" {
                backButton.buttonText.fontColor = pressedButtonColor
            } else {
                backButton.buttonText.fontColor = .white
            }
            
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "BACK" {
                backButton.buttonText.fontColor = pressedButtonColor
            }
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "BACK" {
                print("Returning to main menu!")
                
                
                if let scene = SKScene(fileNamed: "MainMenuScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    // Present the scene
                    view!.presentScene(scene)
                }
                
            }
            

        }
        
    }
}
