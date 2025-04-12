//
//  Untitled.swift
//  Homework11_Stepanenko
//
//  Created by Илья Степаненко on 10.04.25.
//

import UIKit
import SnapKit

class View: UIView {
    
    private var menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menuButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 90)
        return label
    }()
    
    private var buttonAC: UIButton = {
        let button = UIButton()
        button.setTitle("AC", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var plusMinusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+/-", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.backgroundColor = .gray
        return button
    }()
    
    private var percentButton: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var divideButton: UIButton = {
        let button = UIButton()
        button.setTitle("÷", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var sevenButton: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var eightButton: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var nineButton: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("×", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var fourButton: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var fiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var sixButton: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var oneButton: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var twoButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var threeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var calculatorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "calculator"), for: .normal)
        button.backgroundColor = .clear
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var zeroButton: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var commaButton: UIButton = {
        let button = UIButton()
        button.setTitle(",", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var equalsButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.layer.cornerRadius = 43
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame.size = .init(width: 40, height: 40)
        //button.isUserInteractionEnabled = true
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    private var firstLineButtonsGroupContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var secondLineButtonsGroupContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var thirdLineButtonsGroupContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var fourthLineButtonsGroupContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var fifthLineButtonsGroupContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .black
        addSubview(menuButton)
        addSubview(label)
        addSubview(firstLineButtonsGroupContainer)
        addSubview(secondLineButtonsGroupContainer)
        addSubview(thirdLineButtonsGroupContainer)
        addSubview(fourthLineButtonsGroupContainer)
        addSubview(fifthLineButtonsGroupContainer)
        firstLineButtonsGroupContainer.addArrangedSubview(buttonAC)
        firstLineButtonsGroupContainer.addArrangedSubview(plusMinusButton)
        firstLineButtonsGroupContainer.addArrangedSubview(percentButton)
        firstLineButtonsGroupContainer.addArrangedSubview(divideButton)
        secondLineButtonsGroupContainer.addArrangedSubview(sevenButton)
        secondLineButtonsGroupContainer.addArrangedSubview(eightButton)
        secondLineButtonsGroupContainer.addArrangedSubview(nineButton)
        secondLineButtonsGroupContainer.addArrangedSubview(multiplyButton)
        thirdLineButtonsGroupContainer.addArrangedSubview(fourButton)
        thirdLineButtonsGroupContainer.addArrangedSubview(fiveButton)
        thirdLineButtonsGroupContainer.addArrangedSubview(sixButton)
        thirdLineButtonsGroupContainer.addArrangedSubview(minusButton)
        fourthLineButtonsGroupContainer.addArrangedSubview(oneButton)
        fourthLineButtonsGroupContainer.addArrangedSubview(twoButton)
        fourthLineButtonsGroupContainer.addArrangedSubview(threeButton)
        fourthLineButtonsGroupContainer.addArrangedSubview(plusButton)
        fifthLineButtonsGroupContainer.addArrangedSubview(calculatorButton)
        fifthLineButtonsGroupContainer.addArrangedSubview(zeroButton)
        fifthLineButtonsGroupContainer.addArrangedSubview(commaButton)
        fifthLineButtonsGroupContainer.addArrangedSubview(equalsButton)
        
        firstLineButtonsGroupContainer.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        secondLineButtonsGroupContainer.snp.makeConstraints { make in
            make.top.equalTo(firstLineButtonsGroupContainer.snp.bottom)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        thirdLineButtonsGroupContainer.snp.makeConstraints { make in
            make.top.equalTo(secondLineButtonsGroupContainer.snp.bottom)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        fourthLineButtonsGroupContainer.snp.makeConstraints { make in
            make.top.equalTo(thirdLineButtonsGroupContainer.snp.bottom)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        fifthLineButtonsGroupContainer.snp.makeConstraints { make in
            make.top.equalTo(fourthLineButtonsGroupContainer.snp.bottom)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        menuButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
        
        buttonAC.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        plusMinusButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        percentButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        divideButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        sevenButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        eightButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        nineButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        multiplyButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        fourButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        fiveButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        sixButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        minusButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        oneButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        twoButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        threeButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        plusButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        calculatorButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        zeroButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        commaButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        equalsButton.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(200)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}
