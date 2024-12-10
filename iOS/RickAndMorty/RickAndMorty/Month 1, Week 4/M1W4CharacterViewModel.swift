//
//  M1W4CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import Foundation

class M1W4CharacterViewModel {

    let title = "Rick & Morty Character Database"
    let characters = [
        M1W4Character(name: "Rick Sanchez", image: "char-rick", status: "Alive", species: "Human", origin: "Earth"),
        M1W4Character(name: "Morty Smith", image: "char-morty", status: "Alive", species: "Human", origin: "Unknown"),
        M1W4Character(name: "Summer Smith", image: "char-summer", status: "Alive", species: "Human", origin: "Earth"),
        M1W4Character(name: "Beth Smith", image: "char-beth", status: "Alive", species: "Human", origin: "Earth"),
        M1W4Character(name: "Jerry Smith", image: "char-jerry", status: "Alive", species: "Human", origin: "Earth"),
        M1W4Character(name: "Abadango Cluster Princess", image: "char-abadango", status: "Alive", species: "Alien", origin: "Abadango"),
    ]

}
