//
//  Button.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 04/10/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class stdLabel:SKLabelNode{
    
    
    init(name: String, text:String, fontSize: CGFloat,isHidden: Bool) {
        super.init()
        self.fontName = "Helvetica Neue UltraLight"
        self.name = name
        self.text = text
        self.fontSize = fontSize
        self.fontColor = SKColor.white
        self.isHidden = isHidden
        self.zPosition = 4
    }
    
    
    
    
    func addBackground(textureName: String, textureSize:CGSize, buttonName: String){
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        
        var labelBackground: SKSpriteNode
        labelBackground = SKSpriteNode(texture: texture, size: textureSize)
        labelBackground.name = self.name; //?
        labelBackground.zPosition = self.zPosition - 1
        
        
        self.addChild(labelBackground)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
