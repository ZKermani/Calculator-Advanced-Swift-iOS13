//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Zahra Sadeghipoor on 2/11/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateVars: (operand1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(_ symbol: String) -> String? {
        
        if let n = number {
            
            switch symbol {
            case "AC":
                return "0"
            case "+/-":
                return String(n * -1)
            case "%":
                return String(n / 100.0)
            case "=":
                return performTwoOperandOperation(n)
            default:
                intermediateVars = (operand1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoOperandOperation(_ operand2: Double) -> String? {
        
        if let operand1 = intermediateVars?.operand1, let calcMethod = intermediateVars?.calcMethod {
            
            switch calcMethod {
            case "+":
                return String(operand1 + operand2)
            case "-":
                return String(operand1 - operand2)
            case "×":
                return String(operand1 * operand2)
            case "÷":
                return String(operand1 / operand2)
            default:
                return nil
            }
            
        } else {
            return nil
        }
        
    }
}
