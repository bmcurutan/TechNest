//
//  M2W1CharacterModel.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

struct M2W1Characters: Decodable {
    let results: [M2W1Character]
}

struct M2W1Character: Decodable {
    let name: String
    let image: String
    let status: String
    let species: String
    let origin: M2W1Origin
}

struct M2W1Origin: Decodable {
    let name: String
}
