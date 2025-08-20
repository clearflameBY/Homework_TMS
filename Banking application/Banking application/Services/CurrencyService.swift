//
//  CurrencyService.swift
//  Banking application
//
//  Created by Илья Степаненко on 13.08.25.
//

import Foundation

class CurrencyService {
    func fetchRates(completion: @escaping (Result<[CurrencyRate], Error>) -> Void) {
        let urlString = "https://api.nbrb.by/exrates/rates?periodicity=0"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else { return }
            
            do {
                let rates = try JSONDecoder().decode([CurrencyRate].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(rates))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
