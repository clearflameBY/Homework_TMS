//
//  SecondView.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class SecondViewForCallbackBySwitch: UIView {
    
    let switchElement: UISwitch = {
        let switchElement = UISwitch()
        switchElement.translatesAutoresizingMaskIntoConstraints = false
        return switchElement
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go back", for: .normal)
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
        backgroundColor = .gray
        
        addSubview(switchElement)
        addSubview(button)

        NSLayoutConstraint.activate([
    
            switchElement.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            switchElement.centerXAnchor.constraint(equalTo: centerXAnchor),

            button.topAnchor.constraint(equalTo: switchElement.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

