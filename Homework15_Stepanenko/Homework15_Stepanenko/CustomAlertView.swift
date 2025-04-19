//
//  CustomAlertView.swift
//  Homework15_Stepanenko
//
//  Created by Илья Степаненко on 18.04.25.
//

import UIKit

class CustomAlertView: UIView {
                            
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Offer"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Customize your button as needed!"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstButton: CustomButton = {
        let button = CustomButton(title: "IGNORE", rgbColor: (red: 64, green: 64, blue: 64))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: CustomButton = {
        let button = CustomButton(title: "GOT IT", rgbColor: (red: 0, green: 128, blue: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonTapped() {
        removeAlertView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(firstButton)
        addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            firstButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            firstButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            firstButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -5),
            firstButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            secondButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 5),
            secondButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            secondButton.heightAnchor.constraint(equalToConstant: 40),
            secondButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func removeAlertView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame.origin.y = -self.frame.height
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
