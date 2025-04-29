//
//  ViewController.swift
//  Lesson16
//
//  Created by Илья Степаненко on 21.04.25.
//

import UIKit

class GalleryViewController: UIViewController {

    let images = ["image1", "image2", "image3"]
    var currentIndex = 0

    let imageView = UIImageView()
    var nextImageView: UIImageView?

    var originalCenter: CGPoint = .zero
    var originalTransform: CGAffineTransform = .identity

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImageView()
        setupGestures()
        showImage()
    }

    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.frame = view.bounds
        view.addSubview(imageView)
        originalCenter = imageView.center
        originalTransform = imageView.transform
    }

    private func setupGestures() {
        // Свайп
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imageView.addGestureRecognizer(pan)

        // Пинч
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imageView.addGestureRecognizer(pinch)

        // Двойной тап
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTap)
    }

    private func showImage() {
        let imageName = images[currentIndex % images.count]
        imageView.image = UIImage(named: imageName)
        resetImageViewPosition()
    }

    private func resetImageViewPosition() {
        UIView.animate(withDuration: 0.25) {
            self.imageView.transform = .identity
            self.imageView.center = self.view.center
        }
        originalCenter = view.center
        originalTransform = .identity
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let direction: CGFloat = translation.x < 0 ? 1 : -1 // 1 — влево (следующая), -1 — вправо (предыдущая)

        switch gesture.state {
        case .began:
            let nextIndex = (currentIndex + Int(direction) + images.count) % images.count
            let nextImage = UIImage(named: images[nextIndex])
            nextImageView = UIImageView(image: nextImage)
            nextImageView?.contentMode = .scaleAspectFit
            nextImageView?.frame = view.bounds
            nextImageView?.center = CGPoint(x: view.center.x + direction * view.bounds.width, y: view.center.y)
            nextImageView?.isUserInteractionEnabled = false
            if let next = nextImageView {
                view.addSubview(next)
            }

        case .changed:
            imageView.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
            nextImageView?.center = CGPoint(x: view.center.x + direction * view.bounds.width + translation.x, y: view.center.y)

        case .ended, .cancelled:
            if abs(translation.x) > 100 {
                // Завершаем перелистывание
                UIView.animate(withDuration: 0.25, animations: {
                    self.imageView.center = CGPoint(x: self.originalCenter.x - direction * self.view.bounds.width, y: self.originalCenter.y)
                    self.nextImageView?.center = self.view.center
                }, completion: { _ in
                    self.currentIndex = (self.currentIndex + Int(direction) + self.images.count) % self.images.count
                    self.imageView.image = self.nextImageView?.image
                    self.imageView.transform = .identity
                    self.imageView.center = self.view.center
                    self.originalCenter = self.view.center
                    self.originalTransform = .identity
                    self.nextImageView?.removeFromSuperview()
                    self.nextImageView = nil
                })
            } else {
                // Возвращаем обратно
                UIView.animate(withDuration: 0.25, animations: {
                    self.imageView.center = self.originalCenter
                    self.nextImageView?.center = CGPoint(x: self.view.center.x + direction * self.view.bounds.width, y: self.view.center.y)
                }, completion: { _ in
                    self.nextImageView?.removeFromSuperview()
                    self.nextImageView = nil
                })
            }

        default:
            break
        }
    }

    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed || gesture.state == .began {
            let scaledTransform = originalTransform.scaledBy(x: gesture.scale, y: gesture.scale)
            imageView.transform = scaledTransform
        } else if gesture.state == .ended {
            originalTransform = imageView.transform
        }
    }

    @objc private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        resetImageViewPosition()
    }
}
