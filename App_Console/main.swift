//
//  main.swift
//  AppConsole
//
//  Created by Maxime Britto on 02/05/2017.
//  Copyright © 2017 mbritto. All rights reserved.
//

import Foundation
/*
//Exemple de génération de nombre aléatoire
let nombreAleatoire = Math.nombreAleatoire(comprisEntre: 1, et: 100)
print(nombreAleatoire)

//Exemples de saisies utilisateur
print("Entrez votre prénom : ")
let texte:String
texte = Utilisateur.saisirTexte()
print("Bonjour \(texte)")

print("Entrez votre age : ")
let age:Int
age = Utilisateur.saisirEntier()
print("Age : \(age)")

print("Entrez une note : ")
let note:Double
note = Utilisateur.saisirReel()
print("Note : \(note)")
*/

print("Entrez votre prénom : ")
let texte:String
texte = Utilisateur.saisirTexte()

let bot = Bot()
bot.strength = 1
bot.health = 100
var i = 0
repeat {
    print("\(texte) : Appuyer sur entrée pour lancer les dés")
    _ = Utilisateur.saisirTexte()
    let de = lancerDes()
    print("\(texte) : Dé = \(de)")
    bot.health = bot.health - de
    print("\(texte) : Force = \(bot.health)")
    i += 1
} while bot.health > 0
print("Gagné en \(i) coups")

func lancerDes() -> Int {
    let nombreAleatoire = Math.nombreAleatoire(comprisEntre: 2, et: 12)
    return nombreAleatoire
}


