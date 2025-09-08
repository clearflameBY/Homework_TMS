//
//  suggests API.swift
//  Banking application
//
//  Created by Илья Степаненко on 3.09.25.
//

struct DgisSuggestResponse: Codable {
    let result: SuggestResult?
}

struct SuggestResult: Codable {
    let items: [DgisSuggestItem]
}

struct DgisSuggestItem: Codable {
    let id: String
    let name: String
    let point: SuggestPoint?
}

struct SuggestPoint: Codable {
    let lat: Double
    let lon: Double
}
