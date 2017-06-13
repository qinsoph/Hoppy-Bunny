//
//  GameScene.swift
//  Hoppy Bunny
//
//  Created by Sophia Qin on 6/13/17.
//  Copyright © 2017 Sophia Qin. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var hero: SKSpriteNode!
    var sinceTouch : CFTimeInterval = 0
    let fixedDelta: CFTimeInterval = 1.0 / 60.0 /* 60 FPS */

    override func didMove(to view: SKView) {
        hero = self.childNode(withName: "//hero") as! SKSpriteNode
        /* Setup your scene here */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300))
        hero.physicsBody?.applyAngularImpulse(1)
        
        sinceTouch = 0 //time since last touch
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        let velocityY = hero.physicsBody?.velocity.dy ?? 0
        //does something asdf
        if velocityY > 400 {
            hero.physicsBody?.velocity.dy = 400
        }
        
        /* Apply falling rotation */
        if sinceTouch > 0.1 {
            let impulse = -20000 * fixedDelta
            hero.physicsBody?.applyAngularImpulse(CGFloat(impulse))
        }
        
        /* Clamp rotation */
        hero.zRotation.clamp(v1: CGFloat(-90).degreesToRadians(), CGFloat(30).degreesToRadians())
        hero.physicsBody?.angularVelocity.clamp(v1: -2, 2)
        
        /* Update last touch timer */
        sinceTouch += fixedDelta
    }
    
}
