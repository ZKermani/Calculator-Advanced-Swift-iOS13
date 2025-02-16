//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var didFinishTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel text to double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    var calculatorLogic = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        didFinishTyping = true
        calculatorLogic.setNumber(displayValue)
        guard let symbol = sender.currentTitle else {
            fatalError("Calc button does not have a title")
        }
                
        if let result = calculatorLogic.calculate(symbol) {
            displayLabel.text = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if didFinishTyping {
            displayLabel.text = sender.currentTitle
            didFinishTyping = false
        } else {
            guard let num = sender.currentTitle else {
                fatalError("num button has no title!")
            }
            if num == "." { // TODO: Still does not solve the .. issue
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + num
        }
    }

}

