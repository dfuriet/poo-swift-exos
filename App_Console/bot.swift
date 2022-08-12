//
//  bot.swift
//  App_Console
//
//  Created by Damien FURIET on 30/07/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Bot : Fighter {
    
    override var description: String { return "Bot : " + super.description }
    
    init() {
        super.init(health: 100, strength: 1)
    }
    
    /* override func display() {
        print("Bot : ", terminator: "")
        super.display()
    } */
    
    func attack(player:Player) {
        print("Tour de Bot :")
        let deBot = lancerDes() * self.strength
        print("Dé de Bot :  \(deBot)")
        player.health -= deBot
    }
}
