//
//  player.swift
//  App_Console
//
//  Created by Damien FURIET on 01/08/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Player {
    let pseudo:String
    var strength:Int
    var health:Int
    
    init(pseudo:String) {
        if (pseudo.count == 0) {
            self.pseudo = "Anonymous"
        } else {
          self.pseudo = pseudo
        }
        self.strength = 1
        self.health = 100
    }
    
    var isAlive: Bool { self.health > 0}
    
    func display() {
        print("\(self.pseudo) : Force = \(self.strength), Santé = \(self.health)%")
    }
    
    func attack(bot:Bot) {
        print("Tour de \(self.pseudo) :")
        let deJoueur = lancerDes() * self.strength
        print("Dé de \(self.pseudo) : \(deJoueur)")
        bot.health -= deJoueur
    }
    
    func victory(bot:Bot, coups i:Int) {
        print("Bravo \(self.pseudo), vous avez gagné en \(i) coups. J'augmente votre force !")
        self.strength += 1
        self.health = 100
        bot.health = 100
        self.display()
    }
}
