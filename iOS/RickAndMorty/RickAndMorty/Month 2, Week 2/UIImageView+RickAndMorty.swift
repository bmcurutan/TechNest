//
//  UIImageView+RickAndMorty.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/10/24.
//

import UIKit

extension UIImageView {

    func loadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print(error)
                return
            }

            guard let data, let image = UIImage(data: data) else { return }

            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }

}
