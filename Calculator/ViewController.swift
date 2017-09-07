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
        
        var result = 0.0
        if ops == "+"{
            result = Double(firstOperand)! + Double(secondOperand)!
        } else if ops == "*" {
            result = Double(firstOperand)! * Double(secondOperand)!
        } else if ops == "÷" {
            if secondOperand != "0" {
                result = Double(firstOperand)! / Double(secondOperand)!
            }
        } else if ops == "-" {
            result = Double(firstOperand)! - Double(secondOperand)!
        }
        
        ops = ""
        updateDisplay.text = "\(result)"
    }
}

