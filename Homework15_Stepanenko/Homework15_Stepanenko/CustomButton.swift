//
//  CustomButton.swift
//  Homework15_Stepanenko
//
//  Created by Илья Степаненко on 19.04.25.

import UIKit

class CustomButton: UIButton {
    
    init(title: String, rgbColor: (red: Int, green: Int, blue: Int), cornerRadius: CGFloat = 8) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor(
            red: CGFloat(rgbColor.red) / 255,
            green: CGFloat(rgbColor.green) / 255,
            blue: CGFloat(rgbColor.blue) / 255,
            alpha: 1.0
        )
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

