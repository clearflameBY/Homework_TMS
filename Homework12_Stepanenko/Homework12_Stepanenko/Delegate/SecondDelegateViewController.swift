//
//  SecondDelegateViewController.swift
//  Homework12_Stepanenko
//
//  Created by Илья Степаненко on 13.04.25.
//
import UIKit

protocol SecondViewControllerDelegate {
    func sendValue(value: Float)
    func sendValue(value: Bool)
}

class SecondDelegateViewController: UIViewController {

    private var customView = SecondViewForDelegate()

    var delegate: SecondViewControllerDelegate?

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.buttonForSlider.addTarget(self, action: #selector(goBackTappedForSlider), for: .touchUpInside)
        
        customView.buttonForSwitch.addTarget(self, action: #selector(goBackTappedForSwitch), for: .touchUpInside)
    }

    @objc private func goBackTappedForSlider() {
        delegate?.sendValue(value: customView.slider.value)
        dismiss(animated: true)
    }
    
    @objc private func goBackTappedForSwitch() {
        delegate?.sendValue(value: customView.switchElement.isOn)
        dismiss(animated: true)
    }
}
//
//extension SecondDelegateViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        customView.slider.resignFirstResponder()
//        return true
//    }
//}
