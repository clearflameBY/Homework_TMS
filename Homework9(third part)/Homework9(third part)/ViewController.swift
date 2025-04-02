//
//  ViewController.swift
//  Homework9(third part)
//
//  Created by Илья Степаненко on 2.04.25.
//

import UIKit

class ViewController: UIViewController {
    let squareSize: CGFloat = 50
    var squares: [UIView] = []
    var fillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        fillButton = UIButton(type: .system)
        fillButton.setTitle("Заполнить", for: .normal)
        fillButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        fillButton.backgroundColor = .blue
        fillButton.layer.borderColor = UIColor.white.cgColor
        fillButton.layer.borderWidth = 1
        fillButton.setTitleColor(.white, for: .normal)
        fillButton.layer.cornerRadius = 10
        fillButton.frame = CGRect(x: 20, y: view.bounds.height - 80, width: 150, height: 50)
        fillButton.addTarget(self, action: #selector(fillScreen), for: .touchUpInside)
        view.addSubview(fillButton)
    }
    
    @objc func fillScreen() {
        // Очищаем экран перед заполнением
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()
        
        let maxX = Int(ceil(view.bounds.width / squareSize))
        let maxY = Int(ceil(view.bounds.height / squareSize))
        
        for y in 0..<maxY {
            for x in 0..<maxX {
                let square = UIView(frame: CGRect(x: CGFloat(x) * squareSize, y: CGFloat(y) * squareSize, width: squareSize, height: squareSize))
                square.backgroundColor = randomColor()
                view.addSubview(square)
                squares.append(square)
            }
        }
        
        // Перемещаем кнопку наверх, чтобы не перекрывать квадраты
        view.bringSubviewToFront(fillButton)
    }
    
    func randomColor() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
}


#Preview(traits: .portrait) {
    ViewController()
}

