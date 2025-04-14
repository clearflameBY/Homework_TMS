//
//  FirstView.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class FirstView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .cyan
        
        addSubview(label)
        addSubview(button)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
