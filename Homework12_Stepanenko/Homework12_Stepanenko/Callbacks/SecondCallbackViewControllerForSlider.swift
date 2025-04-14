//
//  SecondCallbackViewController.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

class SecondCallbackViewControllerForSlider: UIViewController {

    private var customView = SecondViewForCallbackBySlider()

    var callback: (String) -> Void

    init(callback: @escaping (String) -> Void) {
        self.callback = callback

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.button.addTarget(self, action: #selector(goBackTapped), for: .touchUpInside)
    }

    @objc private func goBackTapped() {
        callback(String(customView.slider.value))
        dismiss(animated: true)
    }
}

