//
//  SecondView.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class SecondViewForDelegate: UIView {
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let switchElement: UISwitch = {
        let switchElement = UISwitch()
        switchElement.translatesAutoresizingMaskIntoConstraints = false
        return switchElement
    }()

    let buttonForSlider: UIButton = {
        let button = UIButton()
        button.setTitle("Go back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonForSwitch: UIButton = {
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
        
        addSubview(slider)
        addSubview(switchElement)
        addSubview(buttonForSlider)
        addSubview(buttonForSwitch)

        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            slider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
            buttonForSlider.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            buttonForSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            switchElement.topAnchor.constraint(equalTo: buttonForSlider.bottomAnchor, constant: 20),
            switchElement.centerXAnchor.constraint(equalTo: centerXAnchor),

            buttonForSwitch.topAnchor.constraint(equalTo: switchElement.bottomAnchor, constant: 10),
            buttonForSwitch.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

