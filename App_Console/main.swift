//
//  main.swift
//  AppConsole
//
//  Created by Maxime Britto on 02/05/2017.
//  Copyright © 2017 mbritto. All rights reserved.
//

import Foundation

print("Entrez votre prénom : ")
let player = Player(pseudo: Utilisateur.saisirTexte())
let bot = Bot()

var i:Int
var isMyTour:Bool = Bool.random()
repeat {
    i = 1
    repeat {
        if isMyTour {
            print("\n\(player.get_pseudo()) : Appuyer sur entrée pour le tour n°\(i)")
            _ = Utilisateur.saisirTexte()
            player.attack(bot:bot)
            bot.display()
            i += 1
        } else {
            bot.attack(player:player)
            player.display()
        }
        
        isMyTour.toggle()
        
        print("===> Player \(player.health)%  : \(player.isAlive) - Bot \(bot.health)%  : \(bot.isAlive)  <===")
    } while player.isAlive && bot.isAlive
    //} while player.health > 0 && bot.health > 0
    
    if bot.health < 0 {
        player.victory(bot: bot, coups:i)
    }
    if player.health < 0 {
        print("Perdu en \(i) coups. Une vie en moins")
        player.health = 100
        player.strength -= 1
    }
} while player.isAlive
print("Game over....")

func lancerDes() -> Int {
    let nombreAleatoire = Math.nombreAleatoire(comprisEntre: 2, et: 12)
    return nombreAleatoire
}
