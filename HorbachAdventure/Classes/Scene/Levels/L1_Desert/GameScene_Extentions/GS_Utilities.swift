//
//  GS_Utilities.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 02/10/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit


extension GameScene{
    
    func createTime(){
        timeSettings()
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1), SKAction.run(calcTime)])))
    }
    
    func timeSettings(){
        time = stdLabel(name: "timeL", text: String(format: "%02d:%02d:%02d", t1, t2, t3), fontSize: 100, isHidden: false)
        time.position = CGPoint(x: 750, y: 410)
        self.addChild(time)
    }
    
    func calcTime(){
        t3+=1
        
        if t3 == 60 {
            t2+=1
            t3=0
        }
        
        if t2 == 60 {
            t1+=1
            t2=0
        }
        time.text = String(format: "%02d:%02d:%02d", t1, t2, t3)
    }
    
    func createScoreLabel(){
        scoreBar = stdLabel(name: "scoreL", text: String(format: "Score: %04d", gamescore), fontSize: 100, isHidden: false)
        scoreBar.position = CGPoint(x: -255, y: time.position.y)
        scoreBar.horizontalAlignmentMode = .left
        
        self.addChild(scoreBar)
    }
    
    func createLifeLabel(){
        lifelabel = stdLabel(name: "lifelabelL", text: "Life: \(lifescore)", fontSize: 81, isHidden: !debugInfoShown)
        lifelabel.position = CGPoint(x:  -1000, y: -430)
        self.addChild(lifelabel)
        
        createHealth()
    }
    
    
    func createHealth(){
        healthBar = health("Heart.png", startHealth: lifescore)
        healthBar.position = CGPoint(x: lifelabel.position.x + 200, y: lifelabel.position.y + 20)
        
        self.addChild(healthBar)
    }
    
    func createPause(){
        pause = stdLabel(name: "pause", text: "Pause", fontSize: 81, isHidden: false)
        pause.position = CGPoint(x: time.position.x, y: time.position.y - 80)
        self.addChild(pause)
    }
    
    func createDebugInfo(){
        debugInfo = stdLabel(name: "debugInfo", text: "-", fontSize: 62, isHidden: true)
        
        if debugInfoShown == false {
            debugInfo.text = "Show Dev Menu"
        } else {
            debugInfo.text = "Hide Dev Menu"
        }
        
        debugInfo.position = CGPoint(x: time.position.x, y: lifelabel.position.y)
        self.addChild(debugInfo)
    }
    
    
    func createGameDeveloperSettings(){
        buttonPlusGameSpeed = stdLabel(name: "buttonPlusGameSpeed", text: "+1", fontSize: 100, isHidden: !debugInfoShown)
        buttonMinusGameSpeed = stdLabel(name: "buttonMinusGameSpeed", text: "-1", fontSize: 100, isHidden: !debugInfoShown)
        buttonResetGameSpeed = stdLabel(name: "buttonResetGameSpeed", text: "R", fontSize: 100, isHidden: !debugInfoShown)
        gameSpeedLabel = stdLabel(name: "gameSpeedLabel", text: "Game Speed: \(gameSpeed)", fontSize: 81, isHidden: !debugInfoShown)
        
        
        buttonPlusGameSpeed.position = CGPoint(x: -self.size.width/4 + 60, y: self.size.height/6 - 50)
        gameSpeedLabel.position = CGPoint(x: 0, y: lifelabel.position.y)
        
        self.addChild(buttonPlusGameSpeed)
        
        buttonMinusGameSpeed.position = CGPoint(x: -190, y: 0)
        buttonPlusGameSpeed.addChild(buttonMinusGameSpeed)
        
        buttonResetGameSpeed.position = CGPoint(x: -170, y: 0)
        buttonMinusGameSpeed.addChild(buttonResetGameSpeed)
        
        self.addChild(gameSpeedLabel)
    }
    
    func exitToMainMenu(){
        print("Going to main menu")
        if let scene = SKScene(fileNamed: "MainMenuScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            // Present the scene
            view!.presentScene(scene)
        }
    }
}
