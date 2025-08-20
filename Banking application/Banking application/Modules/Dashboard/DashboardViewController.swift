//
//  DashboardViewController.swift
//  Banking application
//
//  Created by Илья Степаненко on 14.08.25.
//
import UIKit

class DashboardViewController: UIViewController {
    
    private var rates: [CurrencyRate] = []
    private var metals: [MetalPrice] = []
    private var currencyCodes: [String] = []
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
        customView.allRatesButton.addTarget(self, action: #selector(openAllRates), for: .touchUpInside)
        customView.amountField.addTarget(self, action: #selector(calculateConversion), for: .editingChanged)
        customView.fromCurrencyPicker.dataSource = self
        customView.fromCurrencyPicker.delegate = self
        customView.toCurrencyPicker.dataSource = self
        customView.toCurrencyPicker.delegate = self
    }
    
    private func fetchData() {
        service.fetchRates { [weak self] result in
            switch result {
            case .success(let rates):
                var allRates = rates
                
                // Добавляем BYN в список
                let byn = CurrencyRate(Cur_ID: 0, Cur_Abbreviation: "BYN", Cur_Scale: 1, Cur_Name: "Белорусский рубль", Cur_OfficialRate: 1.0)
                allRates.insert(byn, at: 0)
                
                self?.rates = allRates
                self?.currencyCodes = allRates.map { $0.Cur_Abbreviation }
                
                DispatchQueue.main.async {
                    self?.updateRatesUI()
                    self?.customView.fromCurrencyPicker.reloadAllComponents()
                    self?.customView.toCurrencyPicker.reloadAllComponents()
                }
                
            case .failure(let error):
                print("Ошибка загрузки:", error.localizedDescription)
            }
        }
    }
    
    private func updateRatesUI() {
        customView.ratesStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Валюты
        let wantedCurrencies = ["UAH", "USD", "EUR", "RUB"]
        for rate in rates.filter({ wantedCurrencies.contains($0.Cur_Abbreviation) }) {
            let label = UILabel()
            let ratePerOne = rate.Cur_OfficialRate / Double(rate.Cur_Scale)
            label.text = "\(rate.Cur_Abbreviation): \(String(format: "%.4f", ratePerOne)) BYN"
            customView.ratesStack.addArrangedSubview(label)
        }
        
        // Металлы
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-M-d"
        let today = formatter.string(from: Date())
        let metalsURL = URL(string: "https://api.nbrb.by/bankingots/prices?startdate=\(today)&endDate=\(today)")!
        
        URLSession.shared.dataTask(with: metalsURL) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else { return }
            do {
                let metals = try JSONDecoder().decode([MetalPrice].self, from: data)
                let filtered = metals.filter { $0.MetalId == 0 || $0.MetalId == 1 }
                
                DispatchQueue.main.async {
                    for metal in filtered {
                        let label = UILabel()
                        let name = metal.MetalId == 0 ? "Золото" : "Серебро"
                        label.text = "\(name): \(metal.Value) BYN/грамм"
                        self.customView.ratesStack.addArrangedSubview(label)
                    }
                }
            } catch {
                print("Ошибка парсинга металлов:", error)
                print("Ответ сервера:", String(data: data, encoding: .utf8) ?? "нет данных")
            }
        }.resume()
    }
    
    @objc func calculateConversion() {
        guard
            let fromCode = currencyCodes[safe: customView.fromCurrencyPicker.selectedRow(inComponent: 0)],
            let toCode = currencyCodes[safe: customView.toCurrencyPicker.selectedRow(inComponent: 0)],
            let amountText = customView.amountField.text,
            let amount = Double(amountText),
            let fromRateData = rates.first(where: { $0.Cur_Abbreviation == fromCode }),
            let toRateData = rates.first(where: { $0.Cur_Abbreviation == toCode })
        else { return }
        
        let fromRatePerOne = fromRateData.Cur_OfficialRate / Double(fromRateData.Cur_Scale)
        let toRatePerOne = toRateData.Cur_OfficialRate / Double(toRateData.Cur_Scale)
        
        let result = amount * (fromRatePerOne / toRatePerOne)
        customView.resultLabel.text = String(format: "Результат: %.4f", result)
    }
    
    @objc private func openAllRates() {
        tabBarController?.selectedIndex = 2
    }
}

extension DashboardViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
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
