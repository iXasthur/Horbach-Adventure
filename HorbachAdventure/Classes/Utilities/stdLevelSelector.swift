//
//  stdLevelSelector.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 14/12/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit


class stdLevelSelector: SKNode {
    //levelSelector
    var LSBackground: SKSpriteNode!
    var LSSelectedLevel: SKSpriteNode!
    var LSSelectedLevelName: SKLabelNode!
    var LSLeftArrow: SKSpriteNode!
    var LSRightArrow: SKSpriteNode!
    
    var LSLevelTextureArray = [SKTexture]()
    var LSLevelNames: Array<String>!
    
    
    var selectedLevel = 0
    var size: CGSize!
    
    
    init(availableLevels: Array<String>, blockSize: CGSize, name: String) {
        super.init()
        size = CGSize(width: blockSize.width-10, height: blockSize.height-10)
        LSLevelNames = availableLevels
        
        
        LSBackground = SKSpriteNode(color: .white, size: blockSize)
        self.addChild(LSBackground)
        
        for i in 0...(availableLevels.count-1) {
            LSLevelTextureArray.append(SKTexture(imageNamed: availableLevels[i]))
        }
        
        createLevelSelectorMainBlock()
        setMainButtonNames(buttonName: name)
    }
    
    func createLevelSelectorMainBlock(){
        setSelectedLevel()
        
        self.addChild(LSSelectedLevel)
        LSSelectedLevelName.fontName = "Minecrafter"
        LSSelectedLevelName.zPosition = 1
        LSSelectedLevelName.fontSize = size.height/7
        LSSelectedLevelName.position = CGPoint(x: 0 , y: -size.height/2 + LSSelectedLevelName.fontSize/2)
        
        LSSelectedLevel.addChild(LSSelectedLevelName)
    }
    
    
    func setSelectedLevel() {
        LSSelectedLevel = SKSpriteNode(texture: LSLevelTextureArray[selectedLevel], size: size)
        LSSelectedLevelName = SKLabelNode(text: LSLevelNames[selectedLevel])
        
    }
    
    func setMainButtonNames(buttonName: String){
        self.name = buttonName
        LSBackground.name = self.name
        LSSelectedLevel.name = self.name
        LSSelectedLevelName.name = self.name
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
