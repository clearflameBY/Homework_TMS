//
//  ViewController.swift
//  Homework11_Stepanenko
//
//  Created by Илья Степаненко on 10.04.25.
//

import UIKit

class ViewController: UIViewController {
    
    private var isTypingNumber = false
    private var firstNumber: Double = 0
    private var operation: String = ""
    
    private let customView = View()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.oneButton.addTarget(self, action: #selector(oneButtonTapped), for: .touchUpInside)
        customView.twoButton.addTarget(self, action: #selector(twoButtonTapped), for: .touchUpInside)
        customView.threeButton.addTarget(self, action: #selector(threeButtonTapped), for: .touchUpInside)
        customView.fourButton.addTarget(self, action: #selector(fourButtonTapped), for: .touchUpInside)
        customView.fiveButton.addTarget(self, action: #selector(fiveButtonTapped), for: .touchUpInside)
        customView.sixButton.addTarget(self, action: #selector(sixButtonTapped), for: .touchUpInside)
        customView.sevenButton.addTarget(self, action: #selector(sevenButtonTapped), for: .touchUpInside)
        customView.eightButton.addTarget(self, action: #selector(eightButtonTapped), for: .touchUpInside)
        customView.nineButton.addTarget(self, action: #selector(nineButtonTapped), for: .touchUpInside)
        customView.zeroButton.addTarget(self, action: #selector(zeroButtonTapped), for: .touchUpInside)
        
        customView.plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        customView.minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        customView.multiplyButton.addTarget(self, action: #selector(multiplyButtonTapped), for: .touchUpInside)
        customView.divideButton.addTarget(self, action: #selector(divideButtonTapped), for: .touchUpInside)
        
        customView.equalsButton.addTarget(self, action: #selector(equalsButtonTapped), for: .touchUpInside)
        
        customView.buttonAC.addTarget(self, action: #selector(buttonACTapped), for: .touchUpInside)
    }
    
    @objc
    private func oneButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "1"
        } else {
            customView.textField.text = "1"
            isTypingNumber = true
        }
    }
    @objc
    private func twoButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "2"
        } else {
            customView.textField.text = "2"
            isTypingNumber = true
        }
    }
    @objc
    private func threeButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "3"
        } else {
            customView.textField.text = "2"
            isTypingNumber = true
        }
    }
    @objc
    private func fourButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "4"
        } else {
            customView.textField.text = "4"
            isTypingNumber = true
        }
    }
    @objc
    private func fiveButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "5"
        } else {
            customView.textField.text = "5"
            isTypingNumber = true
        }
    }
    @objc
    private func sixButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "6"
        } else {
            customView.textField.text = "6"
            isTypingNumber = true
        }
    }
    @objc
    private func sevenButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "7"
        } else {
            customView.textField.text = "7"
            isTypingNumber = true
        }
    }
    @objc
    private func eightButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "8"
        } else {
            customView.textField.text = "8"
            isTypingNumber = true
        }
    }
    @objc
    private func nineButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "9"
        } else {
            customView.textField.text = "9"
            isTypingNumber = true
        }
    }
    @objc
    private func zeroButtonTapped() {
        if isTypingNumber {
            customView.textField.text! += "0"
        } else {
            customView.textField.text = "0"
            isTypingNumber = true
        }
    }
    
    @objc
    private func plusButtonTapped() {
        operation = "+"
        firstNumber = Double(customView.textField.text!) ?? 0
        isTypingNumber = false
    }
    @objc
    private func minusButtonTapped() {
        operation = "-"
        firstNumber = Double(customView.textField.text!) ?? 0
        isTypingNumber = false
    }
    @objc
    private func multiplyButtonTapped() {
        operation = "×"
        firstNumber = Double(customView.textField.text!) ?? 0
        isTypingNumber = false
    }
    @objc
    private func divideButtonTapped() {
        operation = "÷"
        firstNumber = Double(customView.textField.text!) ?? 0
        isTypingNumber = false
    }
    
    @objc
    private func equalsButtonTapped() {
        let secondNumber = Double(customView.textField.text!) ?? 0
        var result: Double = 0
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "×":
            result = firstNumber * secondNumber
        case "÷":
            result = firstNumber / secondNumber
        default:
            break
        }
        
        customView.textField.text = String(result)
        isTypingNumber = false
    }
    
    @objc
    private func buttonACTapped() {
        customView.textField.text = "0"
        isTypingNumber = false
        firstNumber = 0
        operation = ""
    }
}
//#Preview(traits: .portrait) {
//    ViewController()
//}

