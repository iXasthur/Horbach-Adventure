//
//  MMS_Touches.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 30/11/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit

extension MainMenuScene {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            
            if atPoint(location).name == "START" {
                startButton.buttonText.fontColor = pressedButtonColor
            } else {
                startButton.buttonText.fontColor = .white
            }
            
            
            if atPoint(location).name == "OPTIONS" {
                optionsButton.buttonText.fontColor = pressedButtonColor
            } else {
                optionsButton.buttonText.fontColor = .white
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if atPoint(location).name == "START" {
                startButton.buttonText.fontColor = pressedButtonColor
            }


            if atPoint(location).name == "OPTIONS" {
                optionsButton.buttonText.fontColor = pressedButtonColor
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "START" {
                
                if levelSelectScene != nil {
                    // Set the scale mode to scale to fit the window
                    levelSelectScene!.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(levelSelectScene)
                } else {
                    print("ERROR: MMLevelSelectScene isn't loaded!")
                }
            }
            
            
            if atPoint(location).name == "OPTIONS" {
                optionsButton.buttonText.fontColor = .white
                
                if optionsScene != nil {
                    // Set the scale mode to scale to fit the window
                    optionsScene!.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(optionsScene)
                } else {
                    print("ERROR: MMOptionsScene isn't loaded!")
                }
            }
        }
  
    }
}
