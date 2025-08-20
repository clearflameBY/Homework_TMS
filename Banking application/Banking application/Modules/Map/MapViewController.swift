//
//  MapViewComtroller.swift
//  Banking application
//
//  Created by Илья Степаненко on 2.08.25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    private let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Карта"
        view.backgroundColor = .systemBackground
        
        mapView.frame = view.bounds
        view.addSubview(mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6176)
        annotation.title = "Банкомат"
        mapView.addAnnotation(annotation)
    }
}
