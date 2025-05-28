//
//  ViewController.swift
//  Homework22_Stepanenko
//
//  Created by Илья Степаненко on 27.05.25.
//

import UIKit

class ViewController: UIViewController {
    
    let cities = ["Москва", "Нью-Йорк", "Лондон", "Париж"]
    let cityLabel = UILabel()
    let pickerView = UIPickerView()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Показать сообщение", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    let imageView = UIImageView()
    let loadImageButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCityLabel()
        setupPickerView()
        setupImageView()
        setupLoadImageButton()
        
        button.addAction(for: .touchUpInside) { _ in
            self.buttonTapped()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loadImageButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            cityLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pickerView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            loadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadImageButton.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20)
        ])
    }
    
    private func setupCityLabel() {
        cityLabel.text = "Выберите город"
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont.systemFont(ofSize: 20)

        view.addSubview(cityLabel)
    }

    private func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self

        view.addSubview(pickerView)
    }

    private func showThankYouMessage() {
            let thankYouAlert = UIAlertController(title: nil,
                                                  message: "Спасибо!",
                                                  preferredStyle: .alert)

            // Автоматически скрываем через 1.5 секунды
            present(thankYouAlert, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    thankYouAlert.dismiss(animated: true, completion: nil)
                }
            }
        }
    
    private func buttonTapped() {
        let alert = UIAlertController(title: "Важное сообщение",
                                      message: "Спасибо, что выбрали наше приложение!",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "OK",
                              style: .default,
                              handler: { _ in
            self.showThankYouMessage()
        }))
        alert.addAction(.init(title: "Отмена", style: .cancel))
        present(alert, animated: true)
        }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1

        view.addSubview(imageView)
    }

    private func setupLoadImageButton() {
        loadImageButton.setTitle("Загрузить изображение", for: .normal)
        loadImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        loadImageButton.addAction(for: .touchUpInside) { _ in
            self.loadImage()
        }

        view.addSubview(loadImageButton)
    }

    private func loadImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = false

        present(picker, animated: true)
    }
}

#Preview {
    ViewController()
}

extension UIControl {
    func addAction(for event: UIControl.Event, action: @escaping UIActionHandler) {
        addAction(UIAction(handler: action), for: event)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityLabel.text = "Вы выбрали: \(cities[row])"
    }
    
    // MARK: - UIImagePickerControllerDelegate

     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let image = info[.originalImage] as? UIImage {
             imageView.image = image
         }
         dismiss(animated: true, completion: nil)
     }

     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
     }
}


