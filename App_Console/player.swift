//
//  player.swift
//  App_Console
//
//  Created by Damien FURIET on 01/08/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Player {
    private let pseudo:String
    private var _strength:Int
    private var _health:Int
    private var weapon:Weapon
    private let weaponListManager = WeaponListManager()
    
    var health:Int {
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
    
    init(pseudo:String) {
        if pseudo.count == 0 {
            self.pseudo = "Anonymous"
        } else {
          self.pseudo = pseudo
        }
        
        self._strength = 1
        self._health = 100
        self.weapon = weaponListManager.getNextWeaponToLoot()!
    }
    
    var isAlive: Bool { self._health > 0}
    
    func get_pseudo() -> String {
        return self.pseudo
    }
    
    func display() {
        print("\(self.pseudo) : Force = \(self._strength), Santé = \(self._health)%")
    }
    
    func attack(bot:Bot) {
        print("Tour de \(self.pseudo) :")
        let deJoueur = lancerDes() * (strength + weapon.power)
        bot.health -= deJoueur
        if Double.random(in: 0.0...1.0) <= weapon.accuracy {
          print("Dé de \(self.pseudo) : \(deJoueur) avec une puissance de \(self.weapon.power) et une précision de \(Int(self.weapon.accuracy * 100))%")
          
        } else {
          print("Dé de \(self.pseudo) : \(deJoueur) Vous avez raté la cible ...")
        }
    }
    
    func victory(bot:Bot, coups i:Int) {
        //weapon = weaponListManager.getNextWeaponToLoot()!
        if let weapon = weaponListManager.getNextWeaponToLoot() {
            print("Bravo \(self.pseudo), vous avez gagné en \(i) coups. J'augmente votre force et vous donne une nouvelle arme \(weapon.get_name()) !")
            strength += 1
            health = 100
            bot.health = 100
            self.display()
        } else {
            print("Plus d'arme !!!")
        }
        
    }
}
