//
//  M1W2CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M1W2CharacterDetailsViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.text = "Rick Sanchez"
        label.textColor = .lightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "char-rick"))
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 24)
        ])

        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 24)
        ])

        for i in 0...2 {
            let label = UILabel()
            var boldText = ""
            var normalText = ""

            switch i {
            case 0:
                boldText = "\u{2022} Status: "
                normalText = "Alive"
            case 1:
                boldText = "\u{2022} Species: "
                normalText = "Human"
            case 2:
                boldText = "\u{2022} Origin: "
                normalText = "Earth"
            default:
                break
            }

            if !boldText.isEmpty && !normalText.isEmpty {
                var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
                let attrString = NSMutableAttributedString(string: boldText, attributes: attrs)
                attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
                let normalString = NSMutableAttributedString(string: normalText, attributes: attrs)
                attrString.append(normalString)
                label.attributedText = attrString
                stackView.addArrangedSubview(label)
            }

            view.addSubview(stackView)
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
                stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
                view.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 24)
            ])
        }
    }
}

