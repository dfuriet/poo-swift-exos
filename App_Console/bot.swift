//
//  bot.swift
//  App_Console
//
//  Created by Damien FURIET on 30/07/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Bot {
    var strength:Int
    var health:Int
    
    init() {
        self.health = 100
        self.strength = 1
    }
    
    func display() {
        print("Bot : Force = \(self.strength), Santé \(self.health)%")
    }
    
    func attack(player:Player) {
        print("Tour de Bot :")
        let deBot = lancerDes() * self.strength
        print("Dé de Bot :  \(deBot)")
        player.health -= deBot
    }
}
