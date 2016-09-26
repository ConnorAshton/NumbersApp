//
//  ViewController.swift
//  Numbers
//
//  Created by Connor Ashton on 25/09/2016.
//  Copyright © 2016 Connor Ashton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayNumberLbl: UILabel!
    
    var runningNumber = ""
    var leftNumStr = ""
    var rightNumStr = ""
    var result = ""
    var currentOperation = Operation.Empty
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayNumberLbl.text = "0"
    }
    
    // Create IBAction for each operator and pass its case into the performCalc function

    @IBAction func numberBtnPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        displayNumberLbl.text = runningNumber
    }
    

    func performCalculation(operation: Operation){
        
        // Check that the currentOperation has an operation case already chosen and is not empty.
        // This is if the user has already pressed a operator then chose another
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                
                rightNumStr = runningNumber
                runningNumber = ""
                
            if currentOperation == Operation.Divide {
                result = "\(Double(leftNumStr)! / Double(rightNumStr)!)"
            } else if currentOperation == Operation.Multiply {
                result = "\(Double(leftNumStr)! * Double(rightNumStr)!)"
            } else if currentOperation == Operation.Add {
                result = "\(Double(leftNumStr)! + Double(rightNumStr)!)"
            } else if currentOperation == Operation.Subtract {
                result = "\(Double(leftNumStr)! - Double(rightNumStr)!)"
            }
                leftNumStr = result
                displayNumberLbl.text = result
            }
                
                currentOperation = operation
                
            } else {
            // This is the first time operator has been pressed
            leftNumStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
        
        
        
    }
    
    @IBAction func dividePressed(sender: AnyObject){
        performCalculation(operation: .Divide)
    }
    
    @IBAction func multiplyPressed(sender: AnyObject){
        performCalculation(operation: .Multiply)
    }
    
    @IBAction func addPressed(sender: AnyObject){
        performCalculation(operation: .Add)
    }
    
    @IBAction func subtractPressed(sender: AnyObject){
        performCalculation(operation: .Subtract)
    }
    
    @IBAction func equalPressed(sender: AnyObject){
        performCalculation(operation: currentOperation)
    }
    
    @IBAction func percentPressed(sender: AnyObject){
        percentButtonPressed()
        
    }

    @IBAction func clearPressed(sender: AnyObject){
        runningNumber = ""
        leftNumStr = ""
        rightNumStr = ""
        result = ""
        currentOperation = Operation.Empty
        
        displayNumberLbl.text = "0"
    }
    
    @IBAction func plusMinusPressed() {
        plusMinusBtnPressed()
    }
    
    @IBAction func decimalPressed(){
        decimalBtnPressed()
    }


    func percentButtonPressed() {
        
        // Another operator has been pressed already
        
        if currentOperation != Operation.Empty {
        
        if runningNumber != "" {
            
        rightNumStr = runningNumber
        
        rightNumStr = "\(Double(leftNumStr)! * Double(rightNumStr)!)"
        rightNumStr = "\(Double(rightNumStr)! / 100)"
            
        runningNumber = rightNumStr
            
        // 100 in LH and now 10 in RH. Press equals
        
        }
        } else {
            
            if runningNumber != "" {
            leftNumStr = runningNumber
            
            let result = "\(Double(leftNumStr)! / 100)"
            runningNumber = result
            displayNumberLbl.text = result
                
            
            
            }
        }
    }
    
    
    func plusMinusBtnPressed() {
        
        if runningNumber != "" {
        runningNumber = "\(Double(runningNumber)! * -1)"
        displayNumberLbl.text = runningNumber
        }
        
    }
    
    func decimalBtnPressed(){
        
            if runningNumber != "" {
            if runningNumber.range(of: ".") == nil {
            runningNumber += "."
            displayNumberLbl.text = runningNumber
        }
        
    }
    }
    

}

