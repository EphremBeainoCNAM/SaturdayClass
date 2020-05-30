//
//  ViewController.swift
//  SaturdayClass
//
//  Created by Ephrem Beaino on 5/30/20.
//  Copyright © 2020 ephrembeaino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func calculateBMIButtonPressed(_ sender: Any) {
        let weightStr = weightTextField.text
        let heightStr = heightTextField.text
        
        let weightKg: Float? = Float(weightStr ?? "")
        let heightCm: Float? = Float(heightStr ?? "")
        
        if let weightKg = weightKg {
            if let heightCm = heightCm {
                if weightKg < 20 || weightKg > 200 {
                    showAlert("Error!", description: "Please enter a reasonable weight!")
                    return
                }
                if heightCm < 0.80 || heightCm > 3.0 {
                    showAlert("Error!", description: "Please enter a reasonable height!")
                    return
                }
                let bmi = weightKg / (heightCm * heightCm)
                if bmi < 18.5 {
                    self.resultLabel.text = "Your BMI is \(bmi), you are underweight, go eat!"
                } else if bmi < 24.9 {
                    self.resultLabel.text = "Your BMI is \(bmi), you are HEALTHY! Congrats!"
                } else {
                    self.resultLabel.text = "Your BMI is \(bmi), you are overweight, go exercices!"
                }
            } else {
                showAlert("Error!", description: "Please enter a correct height!")
            }
        } else {
            //The weight entered value is wrong
            showAlert("Error!", description: "Please enter a correct weight!")
        }
    }
    
    func showAlert(_ title: String, description: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

