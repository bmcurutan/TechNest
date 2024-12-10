//
//  M2W1CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import Foundation

class M2W1CharacterViewModel {

    private let service = M2W1CharacterService()

    private(set) var characters: [M2W1Character] = []
    let title = "Rick & Morty Character Database"
    
    func loadCharacters(completion: @escaping (Bool) -> Void) {
        if let characters = service.fetchLocalCharacters() {
            self.characters = characters
            completion(true)
        } else {
            completion(false)
        }
    }
}
