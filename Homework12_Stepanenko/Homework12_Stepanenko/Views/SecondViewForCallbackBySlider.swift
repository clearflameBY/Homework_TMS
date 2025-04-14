//  SecondView.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class SecondViewForCallbackBySlider: UIView {
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
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
        
        addSubview(slider)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            slider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
            button.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

