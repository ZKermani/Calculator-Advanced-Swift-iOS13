//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Zahra Sadeghipoor on 2/11/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    private var number: Double
    
    init(_ number: Double) {
        self.number = number
    }
    
    func calculate(_ symbol: String) -> String? {
        
        if symbol == "AC" {
            return "0"
        }
        
        if symbol == "+/-" {
            return String(number * -1)
        }
        
        if symbol == "%" {
            return String(number / 100.0)
        }
        
        return nil
    }
}
