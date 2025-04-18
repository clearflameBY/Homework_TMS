//
//  Untitled.swift
//  Lesson13
//
//  Created by Илья Степаненко on 14.04.25.
//

import UIKit

class DetailViewController: UIViewController {
    let photo: Photo

    init(photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: photo.imageName))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        let cityLabel = UILabel()
        cityLabel.text = photo.cityName
        cityLabel.font = UIFont.boldSystemFont(ofSize: 18)
        cityLabel.textAlignment = .center
        view.addSubview(cityLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),

            cityLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
