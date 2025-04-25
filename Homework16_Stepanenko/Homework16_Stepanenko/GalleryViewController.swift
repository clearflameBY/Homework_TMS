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
    var originalCenter: CGPoint = .zero
    var currentScale: CGFloat = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupImageView()
        setupGestures()
        showImage()
    }

    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.frame = view.bounds
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        originalCenter = imageView.center
    }

    func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imageView.addGestureRecognizer(pan)

        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        imageView.addGestureRecognizer(pinch)

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTap)
    }

    func showImage() {
        imageView.image = UIImage(named: images[currentIndex])
        resetTransform()
    }

    func resetTransform() {
        UIView.animate(withDuration: 0.2) {
            self.imageView.transform = .identity
            self.imageView.center = self.originalCenter
        }
        currentScale = 1.0
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        switch gesture.state {
        case .changed:
            imageView.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
        case .ended:
            if abs(translation.x) > 100 {
                if translation.x < 0 {
                    currentIndex = (currentIndex + 1) % images.count
                } else {
                    currentIndex = (currentIndex - 1 + images.count) % images.count
                }
                showImage()
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.imageView.center = self.originalCenter
                }
            }
        default:
            break
        }
    }

    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed || gesture.state == .began {
            let scale = gesture.scale
            let transform = imageView.transform.scaledBy(x: scale, y: scale)
            imageView.transform = transform
            currentScale *= scale
            gesture.scale = 1
        }
    }

    @objc func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        resetTransform()
    }
}
