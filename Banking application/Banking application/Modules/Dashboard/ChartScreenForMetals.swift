//
//  ChartScreeForMetals.swift
//  Banking application
//
//  Created by Илья Степаненко on 7.09.25.
//

import SwiftUI
import Charts

struct ChartScreenForMetals: View {
    @State private var history: [MetaPriceForChart] = []
    private let service = CurrencyServiceForCharts()
    let curId: Int
    let currencyName: String
    
    var body: some View {
        VStack {
            if history.isEmpty {
                ProgressView("Загрузка...")
                    .task {
                        await loadData()
                    }
            } else {
                Chart(history) { item in
                    LineMark(
                        x: .value("Date", formatDate(item.date)),
                        y: .value("BYN", item.value)
                    )
                    .foregroundStyle(.green)
                    .symbol(Circle())
                }
                .frame(height: 300)
                .padding()
            }
        }
        .navigationTitle("Курс: \(currencyName)")
    }
    
    private func loadData() async {
        let endDate = Date()
        //endDate = Calendar.current.date(byAdding: .day, value: -2, to: endDate)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: endDate)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        service.fetchHistoryForMetals(
            curId: curId,
            startDate: formatter.string(from: startDate),
            endDate: formatter.string(from: endDate)
        ) { data in
            DispatchQueue.main.async {
                self.history = data
            }
        }
    }
    
    private func formatDate(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = formatter.date(from: string) {
            let outFormatter = DateFormatter()
            outFormatter.dateFormat = "dd.MM"
            return outFormatter.string(from: date)
        }
        return string
    }
}
