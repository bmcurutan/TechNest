//
//  M2W2CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import Foundation

class M2W2CharacterViewModel {

    private let service = M2W2CharacterService()

    private(set) var characters: [M2W1Character] = []
    let title = "Rick & Morty Character Database"
    
    func loadCharacters(completion: @escaping () -> Void) {
        service.fetchCharacters { [weak self] characters in
            if let characters {
                self?.characters = characters
            }
            completion()
        }
    }
}
