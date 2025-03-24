//
//  ViewController.swift
//  Homework8_Stepanenko
//
//  Created by Илья Степаненко on 24.03.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        print("\(usernameTextField.text ?? "") \(passwordTextField.text ?? "")")
    }
    
}
