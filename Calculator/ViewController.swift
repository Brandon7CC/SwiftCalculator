//
//  ViewController.swift
//  Calculator
//
//  Created by Brandon Dalton on 9/4/17.
//  Copyright © 2017 University of Southern California. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var updateDisplay: UILabel!
    var displayBuffer = ""
    var firstOperand = "", secondOperand = ""
    var ops = ","
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if ops == "" {
            updateDisplay.text = ""
        }
        if sender.currentTitle != nil {
            displayBuffer = displayBuffer + sender.currentTitle!
            self.updateDisplay.text = displayBuffer
        }
    }

    @IBAction func clear(_ sender: UIButton) {
        displayBuffer = ""
        self.updateDisplay.text = "0"
    }
   
    @IBAction func operation(_ sender: UIButton) {
        if sender.currentTitle != nil {
            ops = sender.currentTitle!
            firstOperand = displayBuffer
            displayBuffer = ""
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        secondOperand = displayBuffer
        displayBuffer = ""
        
        var result = 0.0, nan = false
        if ops == "+"{
            result = Double(firstOperand)! + Double(secondOperand)!
        } else if ops == "*" {
            result = Double(firstOperand)! * Double(secondOperand)!
        } else if ops == "÷" {
            if Double(secondOperand) != 0 {
                result = Double(firstOperand)! / Double(secondOperand)!
            } else {
                nan = true
            }
        } else if ops == "-" {
            result = Double(firstOperand)! - Double(secondOperand)!
        }
        
        ops = ""
        
        if !nan {
            updateDisplay.text = "\(result)"
            displayBuffer = "\(result)"
        } else {
            updateDisplay.text = "Divide by Zero"
        }
        
        self.firstOperand = ""
        self.secondOperand = ""
    }
}

