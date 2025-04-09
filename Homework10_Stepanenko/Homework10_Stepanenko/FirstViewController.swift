//
//  ViewController.swift
//  Homework10_Stepanenko
//
//  Created by Илья Степаненко on 9.04.25.
//

import UIKit

// MARK: - Первая вкладка (4 экрана с навигацией)

class FirstViewController: UIViewController {
    let screenNumber: Int
    let isLastScreen: Bool
    
    init(screenNumber: Int, isLastScreen: Bool = false) {
        self.screenNumber = screenNumber
        self.isLastScreen = isLastScreen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: CGFloat(screenNumber) * 0.2,
            green: 0.5,
            blue: 0.7,
            alpha: 1.0
        )
        
        let titleLabel = UILabel()
        titleLabel.text = "Экран \(screenNumber)"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
        
        // Кнопка перехода на следующий экран
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Следующий экран", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        nextButton.backgroundColor = .white
        nextButton.layer.cornerRadius = 10
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Кнопка возврата на первый экран (только на последнем экране)
        if isLastScreen {
            let backToFirstButton = UIButton(type: .system)
            backToFirstButton.setTitle("Вернуться на первый экран", for: .normal)
            backToFirstButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            backToFirstButton.backgroundColor = .white
            backToFirstButton.layer.cornerRadius = 10
            backToFirstButton.translatesAutoresizingMaskIntoConstraints = false
            backToFirstButton.addTarget(self, action: #selector(backToFirstScreen), for: .touchUpInside)
            view.addSubview(backToFirstButton)
            
            NSLayoutConstraint.activate([
                backToFirstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backToFirstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120),
                backToFirstButton.widthAnchor.constraint(equalToConstant: 250),
                backToFirstButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    @objc func goToNextScreen() {
        let nextScreenNumber = screenNumber + 1
        let isLast = nextScreenNumber == 4
        
        let nextVC = FirstViewController(screenNumber: nextScreenNumber, isLastScreen: isLast)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func backToFirstScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
