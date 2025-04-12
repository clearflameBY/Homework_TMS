//
//  ViewController.swift
//  Homework11_Stepanenko
//
//  Created by Илья Степаненко on 10.04.25.
//

import UIKit

class ViewController: UIViewController {

    private let customView = View()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

#Preview(traits: .portrait) {
    ViewController()
}

