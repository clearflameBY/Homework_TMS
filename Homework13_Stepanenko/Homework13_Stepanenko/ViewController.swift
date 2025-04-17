//
//  ViewController.swift
//  Homework13_Stepanenko
//
//  Created by Илья Степаненко on 16.04.25.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    private var settings: [Settings] = [
        Settings(icon: UIImage(named: "Cellular")!, settingName: "Cellular", needsSpacing: false),
        Settings(icon: UIImage(named: "Personal Hotspot")!, settingName: "Personal Hotspot", needsSpacing: true),
        Settings(icon: UIImage(named: "Notifications")!, settingName: "Notifications", needsSpacing: false),
        Settings(icon: UIImage(named: "Sounds")!, settingName: "Sounds", needsSpacing: false),
        Settings(icon: UIImage(named: "Do Not Disturb")!, settingName: "Do Not Disturb", needsSpacing: false),
        Settings(icon: UIImage(named: "Screen Time")!, settingName: "Screen Time", needsSpacing: true),
        Settings(icon: UIImage(named: "General")!, settingName: "General", needsSpacing: false),
        Settings(icon: UIImage(named: "Control Center")!, settingName: "Control Center", needsSpacing: false),
        Settings(icon: UIImage(named: "Display & Brightness")!, settingName: "Display & Brightness", needsSpacing: false),
        Settings(icon: UIImage(named: "Wallpaper")!, settingName: "Wallpaper", needsSpacing: false),
        Settings(icon: UIImage(named: "Siri $ Search")!, settingName: "Siri $ Search", needsSpacing: false),
        Settings(icon: UIImage(named: "Toch ID and Passcode")!, settingName: "Toch ID and Passcode", needsSpacing: false),
        Settings(icon: UIImage(named: "Emergency SOS")!, settingName: "Emergency SOS", needsSpacing: false),
        Settings(icon: UIImage(named: "Battery")!, settingName: "Battery", needsSpacing: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint (equalTo: view.topAnchor), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "settingsCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as? SettingsTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(settings: settings[indexPath.section])

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
}

extension ViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        settings[section].needsSpacing ? 22 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if settings[section].needsSpacing {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedSection = indexPath.section
        let nextViewController: UIViewController
        
        switch selectedSection {
        case 0:
            nextViewController = CellularSettings()
        case 1:
            nextViewController = PersonalHotspotSettings()
        case 2:
            nextViewController = NotificationsSettings()
        default:
            return
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
