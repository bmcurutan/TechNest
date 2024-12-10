//
//  M1W3CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M1W3CharacterListViewController: UIViewController {

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
        title = "Rick & Morty Character Database"
        setupViews()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(M1W3CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "M1W3CharacterCollectionViewCell")
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

extension M1W3CharacterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "M1W3CharacterCollectionViewCell", for: indexPath) as? M1W3CharacterCollectionViewCell else { return UICollectionViewCell() }

        switch indexPath.row {
        case 0:
            cell.image = UIImage(named: "char-rick")
            cell.name = "Rick Sanchez"
        case 1:
            cell.image = UIImage(named: "char-morty")
            cell.name = "Morty Smith"
        case 2:
            cell.image = UIImage(named: "char-summer")
            cell.name = "Summer Smith"
        case 3:
            cell.image = UIImage(named: "char-beth")
            cell.name = "Beth Smith"
        case 4:
            cell.image = UIImage(named: "char-jerry")
            cell.name = "Jerry Smith"
        case 5:
            cell.image = UIImage(named: "char-abadango")
            cell.name = "Abadango Cluster Princess"
        default:
            break
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
}

extension M1W3CharacterListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rickViewController = M1W2CharacterDetailsViewController()
        present(rickViewController, animated: true)
    }
}
