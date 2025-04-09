//
//  Untitled.swift
//  Homework10_Stepanenko
//
//  Created by Илья Степаненко on 9.04.25.
//
import UIKit

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
        dismiss(animated: true)
    }
}
