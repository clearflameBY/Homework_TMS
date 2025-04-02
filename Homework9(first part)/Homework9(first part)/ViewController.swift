//
//  ViewController.swift
//  Homework9(first part)
//
//  Created by Илья Степаненко on 2.04.25.
//

import UIKit

class ViewController: UIViewController {
    
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
        // Удаляем старый кружок, если он есть
        circleView?.removeFromSuperview()
        
        // Получаем случайную позицию
        let randomPosition = getRandomPosition()
        
        // Создаем новый кружок
        circleView = UIView(frame:CGRect(x: randomPosition.x - 60, y: randomPosition.y - 60, width: 60, height: 60))
        circleView.layer.cornerRadius = 30
        
        // Генерация случайного цвета
        circleView.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
        
        // Добавляем кружок на экран
        view.addSubview(circleView)
    }
    
    // Обработчик тапов
    @objc func handleTap() {
        // Создаем новый кружок в случайном месте
        createRandomCircle()
    }
}

#Preview(traits: .portrait) {
    ViewController()
}


