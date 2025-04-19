//
//  ViewController.swift
//  Homework15_Stepanenko
//
//  Created by Илья Степаненко on 18.04.25.
//
import UIKit

class ViewController: UIViewController {
        
    private lazy var showAlertButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать уведомление", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
        
    @objc private func showAlert() {
        
        let alertView = CustomAlertView(frame: CGRect(x: 50, y: -150, width: self.view.frame.width - 100, height: 170))
        self.view.addSubview(alertView)
        
        UIView.animate(withDuration: 0.3, animations: {
            alertView.frame.origin.y = 100
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightText
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(showAlertButton)
        
        NSLayoutConstraint.activate([
            showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showAlertButton.widthAnchor.constraint(equalToConstant: 200),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

