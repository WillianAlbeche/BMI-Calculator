//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var weigthLabel: UILabel!
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var sliderWeigth: UISlider!
    @IBOutlet weak var sliderHeigth: UISlider!

    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderControlHeigthChanged(_ sender: UISlider) {
        let heigth = String(format:"%.2f", sliderHeigth.value)
        heigthLabel.text = "\(heigth)m"
    }


    @IBAction func sliderControlWeigthChanged(_ sender: UISlider) {
        let weigth = String(format: "%.0f",sliderWeigth.value)
        weigthLabel.text = "\(weigth)Kg"
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        let heigth =  sliderHeigth.value
        let weigth = sliderWeigth.value

         calculatorBrain.bmiCalculation(heigth: heigth, weigth: weigth)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
} 

