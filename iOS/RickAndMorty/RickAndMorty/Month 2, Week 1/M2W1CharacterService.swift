//
//  M2W1CharacterService.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import Foundation

class M2W1CharacterService {

    func fetchLocalCharacters() -> [M2W1Character]? {
        guard let fileUrl = Bundle.main.url(forResource: "m2w1_characters", withExtension: "json") else {
            let error = NSError(domain: "FileNotFound", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
            print(error.localizedDescription)
            return nil
        }

        do {
            let data = try Data(contentsOf: fileUrl)
            let characters = try JSONDecoder().decode(M2W1Characters.self, from: data)
            return characters.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
