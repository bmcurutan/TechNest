//
//  M2W1CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M2W1CharacterCollectionViewCell: UICollectionViewCell {
    var character: M2W1Character? {
        didSet {
            guard let character else { return }
            nameLabel.text = character.name
            imageView.image = UIImage(named: character.image)
        }
    }

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = .darkBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true

        contentView.addSubview(imageView)
        let dimen = UIScreen.main.bounds.width / 2 - 64
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            contentView.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: dimen),
            imageView.heightAnchor.constraint(equalToConstant: dimen)
        ])

        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            contentView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
