import UIKit
import PlaygroundSupport

// MARK: - ViewController с UICollectionView
class ImageLoaderViewController: UIViewController, UICollectionViewDataSource {

    let imageURLs: [URL] = [
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://avatars.mds.yandex.net/i?id=fb9f99c9f5b75658793e491747575639d901b453-4440211-images-thumbs&n=13")!,
        URL(string: "https://avatars.mds.yandex.net/i?id=fb9f99c9f5b75658793e491747575639d901b453-4440211-images-thumbs&n=13")!,
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://s01.cdn-pegast.net/get/e7/65/ac/196f1626f7a17bc1f13933af3ce2e378d2ba0e16fb991b0f9b7664bd6a/shlisselburg-3.jpg")!,
        URL(string: "https://avatars.mds.yandex.net/i?id=fb9f99c9f5b75658793e491747575639d901b453-4440211-images-thumbs&n=13")!,
        URL(string: "https://avatars.mds.yandex.net/i?id=fb9f99c9f5b75658793e491747575639d901b453-4440211-images-thumbs&n=13")!
    ]

    var images: [UIImage] = []
    var collectionView: UICollectionView!
    var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadImages()
    }

    func setupUI() {
        // Label для процентов
        progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "Загрузка..."
        progressLabel.textAlignment = .center
        view.addSubview(progressLabel)

        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        // CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }

    func loadImages() {
        let group = DispatchGroup()
        let total = imageURLs.count
        var completed = 0

        for url in imageURLs {
            group.enter()
            DispatchQueue.global().async {
                defer { group.leave() }

                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.images.append(image)
                        completed += 1
                        let percent = Int(Double(completed) / Double(total) * 100)
                        self.progressLabel.text = "Загружено: \(percent)%"
                        self.collectionView.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        completed += 1
                        self.progressLabel.text = "Ошибка загрузки (\(completed)/\(total))"
                    }
                }
            }
        }

        group.notify(queue: .main) {
            self.progressLabel.text = "🎉 Все изображения загружены"
        }
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = images[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        // Очистить предыдущие subviews
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let imageView = UIImageView(image: image)
        imageView.frame = cell.contentView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        cell.contentView.addSubview(imageView)
        return cell
    }
}

// MARK: - Playground запуск
let viewController = ImageLoaderViewController()
PlaygroundPage.current.liveView = UINavigationController(rootViewController: viewController)
PlaygroundPage.current.needsIndefiniteExecution = true

