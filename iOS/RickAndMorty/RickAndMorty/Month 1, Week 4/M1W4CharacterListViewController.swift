//
//  M1W4CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M1W4CharacterListViewController: UIViewController {

    let viewModel = M1W4CharacterViewModel()

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
        collectionView.register(M1W4CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "M1W4CharacterCollectionViewCell")

        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        collectionView.setCollectionViewLayout(layout, animated: true)
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

extension M1W4CharacterListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "M1W4CharacterCollectionViewCell", for: indexPath) as? M1W4CharacterCollectionViewCell else { return UICollectionViewCell() }

        let character = viewModel.characters[indexPath.row]
        cell.character = character
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
}

extension M1W4CharacterListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        let viewController = M1W4CharacterDetailsViewController()
        viewController.character = character
        present(viewController, animated: true)
    }
}