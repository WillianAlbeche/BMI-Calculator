//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Willian Magnum Albeche on 14/11/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    var bmi: BMI?

    mutating func bmiCalculation(heigth: Float, weigth: Float) {
        let bmiValue = weigth / (pow(heigth, 2))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more fruits", color: UIColor(named: "CyanColor")!)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You are in good way", color: UIColor(named: "GreenColor")!)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pizzas", color: UIColor(named: "RedColor")!)
        }
    }

    func getBmiValue() -> String {
        let bmiFloatToString = String(format: "%.2f", bmi?.value ?? 0.0)
        return bmiFloatToString
    }
    func getAdvice() -> String {
        let advice = String("\(bmi?.advice ?? "No advice")")
        return advice
    }

    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }

}
