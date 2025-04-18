//
//  ViewController.swift
//  Lesson13
//
//  Created by Илья Степаненко on 14.04.25.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView = UIImageView()
    let cityLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Настройка изображения
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)

        // Настройка названия города
        cityLabel.font = UIFont.systemFont(ofSize: 14)
        cityLabel.textAlignment = .center
        contentView.addSubview(cityLabel)

        // Авто-лейаут
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),

            cityLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
