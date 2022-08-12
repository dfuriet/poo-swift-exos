//
//  fighter.swift
//  App_Console
//
//  Created by Damien FURIET on 12/08/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Fighter:CustomStringConvertible {
    
    var description: String { return "Force = \(self.strength), Santé = \(self.health)%" }
    
    private var _strength:Int
    private var _health:Int
    
    init(health:Int, strength:Int) {
        self._strength = strength
        self._health = health
    }
    
    var isAlive: Bool { self._health > 0}
    
    var health:Int {
        get { self._health }
        set {
            self._health = max(0, newValue)
        }
    }
    
    var strength:Int {
        get { self._strength }
        set {
            self._strength = max(0, newValue)
        }
    }
    
    /*func display() {
        print("Force = \(self.strength), Santé = \(self.health)%")
    }*/

}
