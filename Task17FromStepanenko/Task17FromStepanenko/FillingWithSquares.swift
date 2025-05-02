//
//  Filling with squares.swift
//  Task17FromStepanenko
//
//  Created by Илья Степаненко on 1.05.25.
//

import UIKit

class FillingWithSquares: UIViewController {
    let squareSize: CGFloat = 50
    var squares: [UIView] = []
    var fillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    func setupButton() {
        fillButton = UIButton(type: .system)
        fillButton.setTitle("Заполнить", for: .normal)
        fillButton.layer.borderColor = UIColor.black.cgColor
        fillButton.layer.borderWidth = 1
        fillButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        fillButton.backgroundColor = .white
        fillButton.setTitleColor(.red, for: .normal)
        fillButton.layer.cornerRadius = 10
        fillButton.frame = CGRect(x: 20, y: view.bounds.height - 80, width: 150, height: 50)
        fillButton.addTarget(self, action: #selector(fillScreen), for: .touchUpInside)
        view.addSubview(fillButton)
    }
    
    @objc func fillScreen() {
        // Удаляем старые квадраты
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()

        let maxX = Int(ceil(view.bounds.width / squareSize))
        let maxY = Int(ceil(view.bounds.height / squareSize))
        var allSquares: [UIView] = []

        for y in 0..<maxY {
            for x in 0..<maxX {
                let square = UIView(frame: CGRect(x: CGFloat(x) * squareSize,
                                                  y: CGFloat(y) * squareSize,
                                                  width: squareSize,
                                                  height: squareSize))
                square.backgroundColor = randomColor()
                square.alpha = 0
                square.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                view.addSubview(square)
                allSquares.append(square)
            }
        }

        // Сортировка снизу вверх (по Y в обратном порядке)
        allSquares.sort { $0.frame.origin.y > $1.frame.origin.y }

        // Перемешиваем внутри одинаковых Y, чтобы было разнообразие
        let groupedByRow = Dictionary(grouping: allSquares) { $0.frame.origin.y }
        var animatedSquares: [UIView] = []
        for row in groupedByRow.keys.sorted(by: >) { // снизу вверх
            var squaresInRow = groupedByRow[row] ?? []
            squaresInRow.shuffle()
            animatedSquares.append(contentsOf: squaresInRow)
        }

        // Анимируем каждый квадрат с случайной задержкой
        for (index, square) in animatedSquares.enumerated() {
            squares.append(square)
            let randomDelay = Double.random(in: 0...(Double(index) * 0.002)) // больше индекс — больше разброс

            UIView.animate(withDuration: 0.3,
                           delay: randomDelay,
                           options: [.curveEaseOut],
                           animations: {
                square.alpha = 1
                square.transform = .identity
            }, completion: nil)
        }

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
