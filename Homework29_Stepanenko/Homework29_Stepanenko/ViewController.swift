//
//  ViewController.swift
//  Homework29_Stepanenko
//
//  Created by Илья Степаненко on 29.06.25.
//
import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private let progressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "0%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = "Нажмите 'Загрузить', чтобы начать"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Загрузить изображения", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startDownload), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties

    // Массив URL-адресов изображений для загрузки
    private let imageUrls: [URL] = [
        URL(string: "https://placehold.co/600x400/FF5733/white?text=Image+1")!,
        URL(string: "https://placehold.co/600x400/33FF57/white?text=Image+2")!,
        URL(string: "https://placehold.co/600x400/3357FF/white?text=Image+3")!,
        URL(string: "https://placehold.co/600x400/FF33A1/white?text=Image+4")!,
        URL(string: "https://placehold.co/600x400/33A1FF/white?text=Image+5")!,
        URL(string: "https://placehold.co/600x400/A1FF33/white?text=Image+6")!,
        URL(string: "https://placehold.co/600x400/A133FF/white?text=Image+7")!
    ]

    private var completedDownloads = 0
    private var totalImagesToDownload: Int {
        return imageUrls.count
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(progressLabel)
        view.addSubview(statusLabel)
        view.addSubview(downloadButton)

        NSLayoutConstraint.activate([
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressLabel.heightAnchor.constraint(equalToConstant: 50),

            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),

            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 50),
            downloadButton.widthAnchor.constraint(equalToConstant: 250),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Actions

    @objc private func startDownload() {
        // Сброс состояния UI перед новой загрузкой
        completedDownloads = 0
        updateProgressUI()
        statusLabel.text = "Начинаем загрузку..."
        downloadButton.isEnabled = false // Отключаем кнопку во время загрузки

        Task {
            // Использование withTaskGroup для параллельной загрузки изображений
            await withTaskGroup(of: Data?.self) { group in
                for url in imageUrls {
                    group.addTask {
                        do {
                            // Загружаем данные изображения. Data? позволяет обработать nil в случае ошибки.
                            let (data, _) = try await URLSession.shared.data(from: url)
                            return data
                        } catch {
                            print("Ошибка загрузки изображения с \(url): \(error.localizedDescription)")
                            return nil // Возвращаем nil в случае ошибки
                        }
                    }
                }

                // Перебираем результаты по мере их завершения
                for await imageData in group {
                    if imageData != nil {
                        // Если изображение успешно загружено, увеличиваем счетчик
                        self.completedDownloads += 1
                    }

                    // Обновляем UI на главном потоке
                    await MainActor.run {
                        self.updateProgressUI()
                    }
                }
            }

            // После завершения всех задач группы (как успешных, так и неуспешных)
            await MainActor.run {
                self.statusLabel.text = "Все изображения загружены"
                self.downloadButton.isEnabled = true // Включаем кнопку обратно
            }
        }
    }

    // MARK: - UI Updates

    private func updateProgressUI() {
        let progress = (Double(completedDownloads) / Double(totalImagesToDownload)) * 100
        progressLabel.text = String(format: "%.0f%%", progress)

        if completedDownloads == totalImagesToDownload {
            statusLabel.text = "Все изображения загружены"
        } else {
            statusLabel.text = "Загружено \(completedDownloads) из \(totalImagesToDownload)"
        }
    }
}
