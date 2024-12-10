//
//  M2W2CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M2W2CharacterListViewController: UIViewController {

    let viewModel = M2W2CharacterViewModel()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Rick & Morty Character Database"
        label.textAlignment = .center
        label.textColor = .lightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupViews()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(M2W2CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "M2W2CharacterCollectionViewCell")

        viewModel.loadCharacters {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 24),
        ])

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            view.rightAnchor.constraint(equalTo: collectionView.rightAnchor)
        ])
    }
}

extension M2W2CharacterListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "M2W2CharacterCollectionViewCell", for: indexPath) as? M2W2CharacterCollectionViewCell else { return UICollectionViewCell() }

        let character = viewModel.characters[indexPath.row]
        cell.character = character
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
}

extension M2W2CharacterListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        let viewController = M2W2CharacterDetailsViewController()
        viewController.character = character
        present(viewController, animated: true)
    }
}
