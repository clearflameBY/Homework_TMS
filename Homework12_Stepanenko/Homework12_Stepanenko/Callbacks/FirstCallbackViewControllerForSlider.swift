//
//  FirstCallbackViewController.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//

import UIKit

class FirstCallbackViewControllerForSlider: UIViewController {

    var customView = FirstView()

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        let viewController = SecondCallbackViewControllerForSlider { [weak self] value in
            self?.customView.label.text = String(value)
        }
        present(viewController, animated: true)
    }
}
