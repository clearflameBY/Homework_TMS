//
//  Screen3ViewController.swift
//  Homework8_Stepanenko
//
//  Created by Илья Степаненко on 24.03.25.
//

import UIKit

class Screen3ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        print("\(usernameTextField.text ?? "") \(passwordTextfield.text ?? "") \(confirmPasswordTextField.text ?? "")")
    }
    
}
