//
//  bot.swift
//  App_Console
//
//  Created by Damien FURIET on 30/07/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Bot {
    private var _strength:Int
    private var _health:Int
    
    var  health:Int {
        get { _health }
        set {
            _health = max(0, newValue)
        }
    }
    
    var strength:Int {
        get { _strength }
        set {
            _strength = max(0, newValue)
        }
    }
    var isAlive: Bool { self._health > 0}
    
    init() {
        self._health = 100
        self._strength = 1
    }
    
    func display() {
        print("Bot : Force = \(self._strength), Santé \(self._health)%")
    }
    
    func attack(player:Player) {
        print("Tour de Bot :")
        let deBot = lancerDes() * self.strength
        print("Dé de Bot :  \(deBot)")
        player.health -= deBot
    }
}
