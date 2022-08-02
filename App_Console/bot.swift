//
//  bot.swift
//  App_Console
//
//  Created by Damien FURIET on 30/07/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Bot {
    var strength:Int = 0
    var health:Int = 0
    
    func display() {
        print("Bot : Force = \(self.strength), Santé \(self.health)%")
    }
    
    func attack(player:Player) {
        print("Tour de Bot :")
        let deBot = self.lancerDes() * self.strength
        print("Dé de Bot :  \(deBot)")
        player.health -= deBot
    }
    
    func lancerDes() -> Int {
        let nombreAleatoire = Math.nombreAleatoire(comprisEntre: 2, et: 12)
        return nombreAleatoire
    }
}
