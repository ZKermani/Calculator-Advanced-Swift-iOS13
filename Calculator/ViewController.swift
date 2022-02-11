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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        didFinishTyping = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if didFinishTyping {
            displayLabel.text = sender.currentTitle
            print(displayValue)
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

