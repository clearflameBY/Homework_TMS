//
//  ViewController.swift
//  Task17FromStepanenko
//
//  Created by Илья Степаненко on 1.05.25.
//

import UIKit

class RandoAppearanceOfCircle: UIViewController {
    
    // Создаём переменную для кружочка
    var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настроим фон экрана
        view.backgroundColor = .white
        
        // Создаём начальный кружок
        createRandomCircle()
        
        // Настроим жест для распознавания тапов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Функция для генерации случайной позиции
    func getRandomPosition() -> CGPoint {
        let x = CGFloat.random(in: 60...view.frame.width - 60)
        let y = CGFloat.random(in: 60...view.frame.height - 60)
        return CGPoint(x: x, y: y)
    }
    
    // Функция для создания кружка с случайными координатами и цветом
    func createRandomCircle() {
        // Анимированное удаление старого кружка (если он есть)
        if let oldCircle = circleView {
            UIView.animate(withDuration: 0.3, animations: {
                oldCircle.alpha = 0
            }, completion: { _ in
                oldCircle.removeFromSuperview()
            })
        }

        // Получаем случайную позицию
        let randomPosition = getRandomPosition()

        // Создаем новый кружок
        let newCircle = UIView(frame: CGRect(x: randomPosition.x - 60, y: randomPosition.y - 60, width: 60, height: 60))
        newCircle.layer.cornerRadius = 30

        // Генерация случайного цвета
        newCircle.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )

        // Начальное состояние — прозрачный
        newCircle.alpha = 0
        view.addSubview(newCircle)
        circleView = newCircle

        // Анимированное появление
        UIView.animate(withDuration: 0.3) {
            newCircle.alpha = 1
        }
    }

    // Обработчик тапов
    @objc func handleTap() {
        // Создаем новый кружок в случайном месте
        createRandomCircle()
    }
}
