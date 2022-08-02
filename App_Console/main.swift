//
//  main.swift
//  AppConsole
//
//  Created by Maxime Britto on 02/05/2017.
//  Copyright © 2017 mbritto. All rights reserved.
//

import Foundation

print("Entrez votre prénom : ")
var player = Player()
player.pseudo = Utilisateur.saisirTexte()
player.strength = 1
player.health = 100

let bot = Bot()
bot.strength = 1
bot.health = 100
var i = 1
var isMyTour:Bool = Bool.random()
repeat {
    print("\n\(player.pseudo) : Appuyer sur entrée pour le tour n°\(i)")
    _ = Utilisateur.saisirTexte()
    
    if isMyTour {
        attack(from: player, to: bot)
        display(bot:bot)
    } else {
        attack(from: bot, to: player)
        display(player: player)
    }
    
    isMyTour.toggle()
    i += 1
} while bot.health >= 0 && player.health >= 0

if bot.health < 0 {
  print("Gagné en \(i) coups")
}
if player.health < 0 {
    print("Perdu en \(i) coups")
}

func lancerDes() -> Int {
    let nombreAleatoire = Math.nombreAleatoire(comprisEntre: 2, et: 12)
    return nombreAleatoire
}

func display(player:Player) {
    print("\(player.pseudo) : Force = \(player.strength), Santé = \(player.health)%")
}

func display(bot:Bot) {
    print("Bot : Force = \(bot.strength), Santé \(bot.health)%")
}

func attack(from player:Player, to bot:Bot) {
    print("Tour de \(player.pseudo) :")
    let deJoueur = lancerDes()
    print("Dé de \(player.pseudo) : \(deJoueur)")
    bot.health -= deJoueur
}

func attack(from bot:Bot, to player:Player) {
    print("Tour de Bot :")
    let deBot = lancerDes()
    print("Dé de Bot :  \(deBot)")
    player.health -= deBot
}
