//
//  MapViewComtroller.swift
//  Banking application
//
//  Created by Илья Степаненко on 2.08.25.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    private let mapView = MKMapView()
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    private var suggestions: [DgisSuggestItem] = []
    private var foundPlaces: [DgisPlace] = []
    private let apiKey = "666718af-29db-461a-967f-9b0cb1cc20e5"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        searchBar.delegate = self
        searchBar.placeholder = "Поиск банкоматов или отделений"
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        mapView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)

        view.addSubview(searchBar)
        view.addSubview(mapView)
        view.addSubview(tableView)
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: scrollView.topAnchor),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200),

            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    // MARK: - SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            suggestions.removeAll()
            tableView.reloadData()
            tableView.isHidden = true
            return
        }
        fetchSuggestions(query: searchText)
    }

    private func fetchSuggestions(query: String) {
        let urlString = "https://catalog.api.2gis.com/3.0/suggests?q=\(query)&key=\(apiKey)&fields=items.point"
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(DgisSuggestResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.suggestions = response.result?.items ?? []
                        self.tableView.reloadData()
                        self.tableView.isHidden = self.suggestions.isEmpty
                    }
                } catch {
                    print("Ошибка парсинга: \(error)")
                }
            }
        }.resume()
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        suggestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = suggestions[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = suggestions[indexPath.row]
        fetchPlaceDetails(id: item.id)
        tableView.isHidden = true
        searchBar.resignFirstResponder()
    }

    // MARK: - Load Details
    private func fetchPlaceDetails(id: String) {
        let urlString = "https://catalog.api.2gis.com/3.0/items/\(id)?key=\(apiKey)&fields=items.point,items.address,items.type"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(DgisItemsResponse.self, from: data)
                    if let place = response.result?.items.first {
                        DispatchQueue.main.async {
                            self.addPlaceToMap(place)
                            self.addPlaceToScroll(place)
                        }
                    }
                } catch {
                    print("Ошибка парсинга деталей: \(error)")
                }
            }
        }.resume()
    }

    private func addPlaceToMap(_ place: DgisPlace) {
        let coordinate = CLLocationCoordinate2D(latitude: place.point.lat, longitude: place.point.lon)
        let annotation = MKPointAnnotation()
        annotation.title = place.name
        annotation.subtitle = place.address
        annotation.coordinate = coordinate

        mapView.addAnnotation(annotation)
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }

    private func addPlaceToScroll(_ place: DgisPlace) {
        foundPlaces.append(place)

        let label = UILabel()
        label.text = place.name
        label.backgroundColor = .systemGray6
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(placeTapped(_:)))
        label.addGestureRecognizer(tap)

        stackView.addArrangedSubview(label)
    }

    @objc private func placeTapped(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel,
              let index = stackView.arrangedSubviews.firstIndex(of: label),
              index < foundPlaces.count else { return }

        let place = foundPlaces[index]
        let coordinate = CLLocationCoordinate2D(latitude: place.point.lat, longitude: place.point.lon)
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
}
