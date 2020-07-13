//
//  ViewController.swift
//  Calculator
//
//  Created by Allan Galdino on 10/09/2019.
//  Copyright © 2020 GaldinoAllanCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  private var isFinishedTypingNumber: Bool = true
  
  private var displayValue: Double {
    get {
      guard let number = Double(displayLabel.text!) else {
        fatalError("Cannot convert display label text to a Double")
      }
      
      return number
    }
    set {
      displayLabel.text = String(newValue)
    }
  }
  
  private var calculator = CalculatorLogic()
  
  @IBOutlet weak var displayLabel: UILabel!
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    //What should happen when a non-number button is pressed
    
    isFinishedTypingNumber = true
    
    calculator.setNumber(displayValue)
    
    if let calcMethod = sender.currentTitle {
           
      if let result = calculator.calculate(symbol: calcMethod) {
        displayValue = result
      }
      
      
    }
  }
  
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    //What should happen when a number is entered into the keypad
    
    if let numValue = sender.currentTitle{
      if isFinishedTypingNumber {
        displayLabel.text = numValue
        isFinishedTypingNumber = false
      } else {
        if numValue == "." {
          
          let isInt = floor(displayValue) == displayValue
          
          if !isInt {
            return
          }
        }
        
        displayLabel.text = displayLabel.text! + numValue
      }
    }
  }
}
