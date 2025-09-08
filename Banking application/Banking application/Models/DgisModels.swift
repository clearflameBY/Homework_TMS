//
//  ModelForMap.swift
//  Banking application
//
//  Created by Илья Степаненко on 1.09.25.
//

import UIKit

struct DgisItemsResponse: Codable {
    let result: ItemsResult?
}

struct ItemsResult: Codable {
    let items: [DgisPlace]
}

struct DgisPlace: Codable {
    let id: String
    let name: String
    let address: String?
    let point: Point
    let type: String?
}

struct Point: Codable {
    let lat: Double
    let lon: Double
}
