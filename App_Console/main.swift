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
        print("\n\(player.pseudo) : Appuyer sur entrée pour le tour n°\(i)")
        _ = Utilisateur.saisirTexte()
        
        if isMyTour {
            player.attack(bot:bot)
            bot.display()
        } else {
            bot.attack(player:player)
            player.display()
        }
        
        isMyTour.toggle()
        i += 1
    } while bot.health >= 0 && player.health >= 0
    
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
