//
//  settingsTableViewCell.swift
//  Homework13_Stepanenko
//
//  Created by Илья Степаненко on 16.04.25.
//
import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    private var icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private var settingsName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var arrowIcon: UIImageView = {
        let arrowIcon = UIImageView()
        arrowIcon.image = UIImage(named: "Arrow")
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        return arrowIcon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {

        addSubview(icon)
        addSubview(settingsName)
        addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            settingsName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            settingsName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            
            arrowIcon.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            arrowIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        arrowIcon.snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }
        
    }
    
    func configureCell(settings: Settings) {
        icon.image = settings.icon
        settingsName.text = settings.settingName
    }
}
