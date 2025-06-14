//
//  ViewController.swift
//  Stepanenko_Homework26
//
//  Created by Илья Степаненко on 14.06.25.
//

import UIKit

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

class UsersViewController: UITableViewController {
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пользователи"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchUsers()
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Ошибка: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                    self.tableView.reloadData()
                }
            } catch {
                print("Ошибка декодирования: \(error)")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
}

