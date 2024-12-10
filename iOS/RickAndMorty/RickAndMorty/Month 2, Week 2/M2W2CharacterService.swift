//
//  M2W2CharacterService.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/10/24.
//

import Foundation

class M2W2CharacterService {

    private let characterUrl = URL(string: "https://rickandmortyapi.com/api/character")!

    func fetchCharacters(completion: @escaping ([M2W1Character]?) -> Void) {
        URLSession.shared.dataTask(with: characterUrl) { data, _, error in
            if let error {
                print(error.localizedDescription)
                completion(nil)
            }

            guard let data else { return }

            do {
                let characters = try JSONDecoder().decode(M2W1Characters.self, from: data).results
                completion(characters)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }

}
