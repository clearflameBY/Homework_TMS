//
//  FirstViewController.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class FirstDelegateViewController: UIViewController {

    var customView = FirstView()

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        let viewController = SecondDelegateViewController()
        viewController.delegate = self
        present(viewController, animated: true)
    }
}

extension FirstDelegateViewController: SecondViewControllerDelegate {
    
    func sendValue(value: Bool) {
        customView.label.text = String(value)
    }
    
    func sendValue(value: Float) {
        customView.label.text = String(value)
    }
}
