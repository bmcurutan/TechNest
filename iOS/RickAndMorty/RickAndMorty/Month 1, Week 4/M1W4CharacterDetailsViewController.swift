//
//  M1W4CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Bianca Curutan on 12/9/24.
//

import UIKit

class M1W4CharacterDetailsViewController: UIViewController {

    var character: M1W4Character? {
        didSet {
            guard let character else { return }
            nameLabel.text = character.name
            imageView.image = UIImage(named: character.image)

            let statusLabel = M1W4PropertyLabel(boldText: "Status", normalText: character.status)
            stackView.addArrangedSubview(statusLabel)

            let speciesLabel = M1W4PropertyLabel(boldText: "Species", normalText: character.species)
            stackView.addArrangedSubview(speciesLabel)

            let originLabel = M1W4PropertyLabel(boldText: "Origin", normalText: character.origin)
            stackView.addArrangedSubview(originLabel)
        }
    }

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

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 24)
        ])
    }
}

private class M1W4PropertyLabel: UILabel {

    convenience init(boldText: String, normalText: String) {
        self.init(frame: .zero)

        let bulletedBoldText = "\u{2022} \(boldText): "
        var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attrString = NSMutableAttributedString(string: bulletedBoldText, attributes: attrs)
        attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        let normalString = NSMutableAttributedString(string: normalText, attributes: attrs)
        attrString.append(normalString)
        attributedText = attrString
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
