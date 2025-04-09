//
//  AppTabBarController.swift
//  Homework10_Stepanenko
//
//  Created by Илья Степаненко on 9.04.25.
//

import UIKit

// MARK: - Настройка TabBarController

class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Первая вкладка (с навигацией)
        let firstVC = FirstViewController(screenNumber: 1)
        let navController = UINavigationController(rootViewController: firstVC)
        navController.tabBarItem = UITabBarItem(
            title: "Навигация",
            image: UIImage(systemName: "1.circle"),
            tag: 0
        )
        
        // Вторая вкладка (present/dismiss)
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(
            title: "Present",
            image: UIImage(systemName: "2.circle"),
            tag: 1
        )
        
        // Третья вкладка (кастомный init)
        let thirdVC = ThirdViewController(customText: "Этот текст передан через кастомный инициализатор!")
        thirdVC.tabBarItem = UITabBarItem(
            title: "Кастомный init",
            image: UIImage(systemName: "3.circle"),
            tag: 2
        )
        
        // Установка вкладок
        viewControllers = [navController, secondVC, thirdVC]
    }
}

