//
//  stdButton.swift
//  HorbachAdventure
//
//  Created by Михаил Ковалевский on 22/11/2018.
//  Copyright © 2018 FunnyZeks. All rights reserved.
//

import SpriteKit
//import Foundation


class stdButton:SKSpriteNode{
    var buttonText: stdLabel!
    
    init(_ textureName: String, buttonSize:CGSize, buttonName: String, fontSize: CGFloat) {
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        
        super.init(texture: texture, color: .clear, size: buttonSize)
        
        self.name = buttonName
        
        
        
        buttonText = stdLabel(name: buttonName, text: buttonName, fontSize: fontSize, isHidden: false)
        buttonText.fontName = "Minecrafter"
        buttonText.position = CGPoint(x: self.position.x, y: self.position.y)
        //buttonText.position = self.position
        
        self.addChild(buttonText)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

