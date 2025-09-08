//
//  DashboardViewController.swift
//  Banking application
//
//  Created by Илья Степаненко on 14.08.25.
//
import UIKit
import Charts
import SwiftUI

final class DashboardViewController: UIViewController {
    
    private var rates: [CurrencyRate] = []
//    private var metals: [MetalPrice] = []
    private var curenciesData: [String] = []
    private var currencyCodes: [String] = []
    private var currentTagOfLabel = 0
    private var currentAbbreviationOfCurrency = ""
    
    private let service = CurrencyService()
    
    private let customView = DashboardView()

    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Dashboard"
        
        fetchData()
        
        let openRates = UIAction(handler: { _ in
            self.openAllRates()
        })
        let calculateConversion = UIAction(handler: { _ in
            self.calculateConversion()
        })
        
        let recognizer = UITapGestureRecognizer(target: customView, action: #selector(customView.endEditing))
        recognizer.numberOfTapsRequired = 1
        recognizer.cancelsTouchesInView = false // for working tableView
        customView.addGestureRecognizer(recognizer)
        
        customView.allRatesButton.addAction(openRates, for: .touchUpInside)
        customView.amountField.addAction(calculateConversion, for: .editingChanged)
        customView.fromCurrencyPicker.dataSource = self
        customView.fromCurrencyPicker.delegate = self
        customView.toCurrencyPicker.dataSource = self
        customView.toCurrencyPicker.delegate = self
        customView.rates.dataSource = self
        customView.rates.delegate = self
    }
    
    private func fetchData() {
        service.fetchRates { [weak self] result in
            switch result {
            case .success(let rates):
                self?.handleSuccessFetchRates(rates)
            case .failure(let error):
                print("Ошибка загрузки:", error.localizedDescription)
            }
        }
    }
    
    private func handleSuccessFetchRates(_ rates: [CurrencyRate]) {
        var allRates = rates
        
        let byn = CurrencyRate(curID: 0, curAbbreviation: "BYN", curScale: 1, curName: "Белорусский рубль", curOfficialRate: 1.0)
        allRates.insert(byn, at: 0)
        
        self.rates = allRates
        self.currencyCodes = allRates.map { $0.curAbbreviation }
        
        DispatchQueue.main.async {
            self.updateRatesUI()
            self.customView.fromCurrencyPicker.reloadAllComponents()
            self.customView.toCurrencyPicker.reloadAllComponents()
        }
    }
    
    private func updateRatesUI() {        
        // Валюты
        let wantedCurrencies = ["UAH", "USD", "EUR", "RUB"]
        for rate in rates.filter({ wantedCurrencies.contains($0.curAbbreviation) }) {
            let ratePerOne = rate.curOfficialRate / Double(rate.curScale)
            curenciesData.append("\(rate.curAbbreviation): \(String(format: "%.4f", ratePerOne)) BYN")
        }
        
        // Металлы
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var dayForMetalCurrency = Date()
        
        while Calendar.current.isDateInWeekend(dayForMetalCurrency) {
            dayForMetalCurrency = Calendar.current.date(byAdding: .day, value: -1, to: dayForMetalCurrency)!
        }
        
        let dayForMetalCurrencyString = formatter.string(from: dayForMetalCurrency)
        let metalsURL = URL(string: "https://api.nbrb.by/bankingots/prices?startdate=\(dayForMetalCurrencyString)&endDate=\(dayForMetalCurrencyString)")!
        
        URLSession.shared.dataTask(with: metalsURL) { [weak self] data, _, error  in
            guard let self = self, let data = data else { return }
            do {
                let metals = try JSONDecoder().decode([MetalPrice].self, from: data)
                let filtered = metals.filter { $0.metalId == 0 || $0.metalId == 1 }
                
                DispatchQueue.main.async {
                    for metal in filtered {
                        let name = metal.metalId == 0 ? "Золото" : "Серебро"
                        self.curenciesData.append("\(name): \(metal.value) BYN/грамм")
                    }
                    self.customView.rates.reloadData()
                }
            } catch {
                print("Ошибка парсинга металлов:", error)
                print("Ответ сервера:", String(data: data, encoding: .utf8) ?? "нет данных")
            }
        }.resume()
    }
    
//    private func loadLastWorkdayRates() -> [MetalPrice]? {
//        guard let data = UserDefaults.standard.data(forKey: "lastWorkdayRates"),
//              let metals = try? JSONDecoder().decode([MetalPrice].self, from: data) else {
//            return nil
//        }
//        return metals
//    }
    
    
    @objc private func showGraph(row: Int) {
        var currencyId = 0
        var currentAbbreviationOfCurrency = ""
        var curScale = 1
        
        switch row {
        case 0:
            currencyId = 431
            currentAbbreviationOfCurrency = "USD"
        case 1:
            currencyId = 451
            currentAbbreviationOfCurrency = "EUR"
        case 2:
            currencyId = 449
            currentAbbreviationOfCurrency = "UAH"
            curScale = 100
        case 3:
            currencyId = 456
            currentAbbreviationOfCurrency = "RUB"
            curScale = 100
        case 4:
            currencyId = 0
            currentAbbreviationOfCurrency = "XAU"
        case 5:
            currencyId = 1
            currentAbbreviationOfCurrency = "XAG"
        default:
            break
        }
        
        if currencyId == 0 || currencyId == 1 {
            let chartView = ChartScreenForMetals(curId: currencyId, currencyName: currentAbbreviationOfCurrency)
            let chartVC = UIHostingController(rootView: chartView)
            navigationController?.pushViewController(chartVC, animated: true)
        } else {
            let chartView = ChartScreenForCurrency(curScale: curScale, curId: currencyId, currencyName: currentAbbreviationOfCurrency)
            let chartVC = UIHostingController(rootView: chartView)
            navigationController?.pushViewController(chartVC, animated: true)
        }
    }
    
    private func calculateConversion() {
        guard
            let fromCode = currencyCodes[safe: customView.fromCurrencyPicker.selectedRow(inComponent: 0)],
            let toCode = currencyCodes[safe: customView.toCurrencyPicker.selectedRow(inComponent: 0)],
            let amountText = customView.amountField.text,
            let amount = Double(amountText),
            let fromRateData = rates.first(where: { $0.curAbbreviation == fromCode }),
            let toRateData = rates.first(where: { $0.curAbbreviation == toCode })
        else { return }
        
        let fromRatePerOne = fromRateData.curOfficialRate / Double(fromRateData.curScale)
        let toRatePerOne = toRateData.curOfficialRate / Double(toRateData.curScale)
        
        let result = amount * (fromRatePerOne / toRatePerOne)
        customView.resultLabel.text = String(format: "Результат: %.2f", result)
    }
    
    private func openAllRates() {
        tabBarController?.selectedIndex = 2
    }
}

extension DashboardViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencyCodes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyCodes[safe: row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        calculateConversion()
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curenciesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .default
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.text = curenciesData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        customView.rates.deselectRow(at: indexPath, animated: true)
        showGraph(row: indexPath.row)
    }
}
