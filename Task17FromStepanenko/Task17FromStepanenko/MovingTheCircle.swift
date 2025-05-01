//
//  Untitled.swift
//  Task17FromStepanenko
//
//  Created by Илья Степаненко on 1.05.25.
//

import UIKit

class MovingTheCircle: UIViewController {
    let circleSize: CGFloat = 50
    let step: CGFloat = 20
    var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupCircle()
        setupButtons()
    }
    
    func setupCircle() {
        let startX = (view.bounds.width - circleSize) / 2
        let startY = (view.bounds.height - circleSize) / 2
        
        circleView = UIView(frame: CGRect(x: startX, y: startY, width: circleSize, height: circleSize))
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
    }
    
    func setupButtons() {
        let buttonSize: CGFloat = 60
        let spacing: CGFloat = 20
        let centerX = view.bounds.midX
        let bottomY = view.bounds.height - buttonSize - 50
        
        let upButton = createButton(title: "↑", action: #selector(moveUp))
        upButton.frame = CGRect(x: centerX - buttonSize / 2, y: bottomY - (buttonSize + spacing), width: buttonSize, height: buttonSize)
        
        let downButton = createButton(title: "↓", action: #selector(moveDown))
        downButton.frame = CGRect(x: centerX - buttonSize / 2, y: bottomY, width: buttonSize, height: buttonSize)
        
        let leftButton = createButton(title: "←", action: #selector(moveLeft))
        leftButton.frame = CGRect(x: centerX - buttonSize - spacing, y: bottomY, width: buttonSize, height: buttonSize)
        
        let rightButton = createButton(title: "→", action: #selector(moveRight))
        rightButton.frame = CGRect(x: centerX + spacing, y: bottomY, width: buttonSize, height: buttonSize)
        
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }
    
    func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func animatePulse() {
        UIView.animate(withDuration: 0.1, animations: {
            self.circleView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.circleView.transform = .identity
            }
        })
    }
    
    func leaveTrail() {
        let trail = UIView(frame: circleView.frame)
        trail.backgroundColor = circleView.backgroundColor?.withAlphaComponent(0.4)
        trail.layer.cornerRadius = circleView.layer.cornerRadius
        view.insertSubview(trail, belowSubview: circleView)

        UIView.animate(withDuration: 0.5, animations: {
            trail.alpha = 0
            trail.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            trail.removeFromSuperview()
        })
    }
    
    // Эти функции не дают кружочку выйти за экран
    @objc func moveUp() {
        let newY = max(circleView.frame.origin.y - step, 0)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin.y = newY
        }
        animatePulse()
        leaveTrail()
    }

    @objc func moveDown() {
        let newY = min(circleView.frame.origin.y + step, view.bounds.height - circleSize)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin.y = newY
        }
        animatePulse()
        leaveTrail()
    }

    @objc func moveLeft() {
        let newX = max(circleView.frame.origin.x - step, 0)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin.x = newX
        }
        animatePulse()
        leaveTrail()
    }

    @objc func moveRight() {
        let newX = min(circleView.frame.origin.x + step, view.bounds.width - circleSize)
        UIView.animate(withDuration: 0.2) {
            self.circleView.frame.origin.x = newX
        }
        animatePulse()
        leaveTrail()
    }
}
