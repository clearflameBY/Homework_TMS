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

// MARK: - Вторая вкладка (present/dismiss)

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        let titleLabel = UILabel()
        titleLabel.text = "Вторая вкладка"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
        
        let presentButton = UIButton(type: .system)
        presentButton.setTitle("Present новый экран", for: .normal)
        presentButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        presentButton.backgroundColor = .white
        presentButton.layer.cornerRadius = 10
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        view.addSubview(presentButton)
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            presentButton.widthAnchor.constraint(equalToConstant: 250),
            presentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func presentModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true, completion: nil)
    }
}

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        
        let titleLabel = UILabel()
        titleLabel.text = "Modal экран"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
        
        let dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        dismissButton.backgroundColor = .white
        dismissButton.layer.cornerRadius = 10
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            dismissButton.widthAnchor.constraint(equalToConstant: 200),
            dismissButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Третья вкладка (кастомный init с параметром)

class ThirdViewController: UIViewController {
    let customText: String
    
    init(customText: String) {
        self.customText = customText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        let label = UILabel()
        label.text = customText
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - Настройка TabBarController

class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Первая вкладка (с навигацией)
        let firstVC = FirstViewController(screenNumber: 1)
        let navController = UINavigationController(rootViewController: firstVC)
        navController.tabBarItem = UITabBarItem(
            title: "Навигация",
            image: UIImage(systemName: "1.circle"),
            tag: 0
        )
        
        // Вторая вкладка (present/dismiss)
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(
            title: "Present",
            image: UIImage(systemName: "2.circle"),
            tag: 1
        )
        
        // Третья вкладка (кастомный init)
        let thirdVC = ThirdViewController(customText: "Этот текст передан через кастомный инициализатор!")
        thirdVC.tabBarItem = UITabBarItem(
            title: "Кастомный init",
            image: UIImage(systemName: "3.circle"),
            tag: 2
        )
        
        // Установка вкладок
        viewControllers = [navController, secondVC, thirdVC]
    }
}

