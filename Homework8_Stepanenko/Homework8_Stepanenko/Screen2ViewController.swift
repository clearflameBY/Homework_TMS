//
//  Screen2ViewController.swift
//  Homework8_Stepanenko
//
//  Created by Илья Степаненко on 24.03.25.
//

import UIKit

class Screen2ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var temperatureValue: UILabel!
    
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
    @IBAction func sliderChanged(_ sender: UISlider) {
        temperatureValue.text = String(Int(slider.value))
    }
    
    
}
