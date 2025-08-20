//
//  ChartViewController.swift
//  Banking application
//
//  Created by Илья Степаненко on 16.08.25.
//

//import UIKit
//import Charts
//
//struct CurrencyHistory: Codable {
//    let Date: String
//    let Cur_OfficialRate: Double
//}
//
//class ChartViewController: UIViewController {
//    var currencyId: Int = 0
//    var currencyName: String = ""
//    
//    private let lineChartView = LineChartView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "График \(currencyName)"
//        view.backgroundColor = .systemBackground
//        
//        setupChart()
//        fetchHistory()
//    }
//    
//    private func setupChart() {
//        lineChartView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(lineChartView)
//        
//        NSLayoutConstraint.activate([
//            lineChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            lineChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
//        ])
//    }
//    
//    private func fetchHistory() {
//        let today = Date()
//        let calendar = Calendar.current
//        let startDate = calendar.date(byAdding: .day, value: -30, to: today)! // последние 30 дней
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        
//        let urlStr = "https://api.nbrb.by/ExRates/Rates/Dynamics/\(currencyId)?startDate=\(formatter.string(from: startDate))&endDate=\(formatter.string(from: today))"
//        
//        guard let url = URL(string: urlStr) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else { return }
//            
//            do {
//                let history = try JSONDecoder().decode([CurrencyHistory].self, from: data)
//                DispatchQueue.main.async {
//                    self.updateChart(with: history)
//                }
//            } catch {
//                print("Ошибка парсинга истории: \(error)")
//            }
//        }.resume()
//    }
//    
//    private func updateChart(with history: [CurrencyHistory]) {
//        let entries = history.enumerated().map { index, item in
//            ChartDataEntry(x: Double(index), y: item.Cur_OfficialRate)
//        }
//        
//        let dataSet = LineChartDataSet(entries: entries, label: currencyName)
//        dataSet.colors = [.systemBlue]
//        dataSet.circleColors = [.systemBlue]
//        dataSet.circleRadius = 3
//        
//        lineChartView.data = LineChartData(dataSet: dataSet)
//    }
//}
