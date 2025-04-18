//
//  ViewController.swift
//  Lesson13
//
//  Created by Илья Степаненко on 14.04.25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var numberOfColumns: Int = 3 // Количество столбцов по умолчанию

    let photos = [
        Photo(imageName: "barselona", cityName: "Barselona"),
        Photo(imageName: "dubai", cityName: "Dubai"),
        Photo(imageName: "la", cityName: "LA"),
        Photo(imageName: "london", cityName: "London"),
        Photo(imageName: "newYork", cityName: "New York"),
        Photo(imageName: "paris", cityName: "Paris"),
        Photo(imageName: "roma", cityName: "Roma"),
        Photo(imageName: "tokyo", cityName: "Tokyo")
    ]

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")

        view.addSubview(collectionView)
        
        // Добавляем кнопки на панель навигации
        setupNavigationBarButtons()
    }
    
    func setupNavigationBarButtons() {
        // Создание пяти кнопок для изменения столбцов
        let oneColumnButton = UIBarButtonItem(title: "1", style: .plain, target: self, action: #selector(setOneColumn))
        let twoColumnsButton = UIBarButtonItem(title: "2", style: .plain, target: self, action: #selector(setTwoColumns))
        let threeColumnsButton = UIBarButtonItem(title: "3", style: .plain, target: self, action: #selector(setThreeColumns))
        let fourColumnsButton = UIBarButtonItem(title: "4", style: .plain, target: self, action: #selector(setFourColumns))
        let fiveColumnsButton = UIBarButtonItem(title: "5", style: .plain, target: self, action: #selector(setFiveColumns))
        
        // Добавляем кнопки на панель навигации
        navigationItem.rightBarButtonItems = [oneColumnButton, twoColumnsButton, threeColumnsButton, fourColumnsButton, fiveColumnsButton]
    }
    
    // Методы для изменения количества столбцов
    @objc func setOneColumn() {
        updateNumberOfColumns(1)
    }
    
    @objc func setTwoColumns() {
        updateNumberOfColumns(2)
    }
    
    @objc func setThreeColumns() {
        updateNumberOfColumns(3)
    }
    
    @objc func setFourColumns() {
        updateNumberOfColumns(4)
    }
    
    @objc func setFiveColumns() {
        updateNumberOfColumns(5)
    }
    
    func updateNumberOfColumns(_ columns: Int) {
        numberOfColumns = columns
        collectionView.collectionViewLayout.invalidateLayout() // Обновление макета
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.item]
        cell.imageView.image = UIImage(named: photo.imageName)
        cell.cityLabel.text = photo.cityName
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - CGFloat(numberOfColumns - 1) * 10) / CGFloat(numberOfColumns)
        return CGSize(width: width, height: width * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.item]
        let detailVC = DetailViewController(photo: photo)
        present(detailVC, animated: true, completion: nil)
    }
}
