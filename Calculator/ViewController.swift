//
//  ViewController.swift
//  Calculator
//
//  Created by Allan Galdino on 10/09/2019.
//  Copyright © 2020 GaldinoAllanCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
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
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  @IBOutlet weak var displayLabel: UILabel!
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    //What should happen when a non-number button is pressed
    isFinishedTypingNumber = true
    
    if let calcMethod = sender.currentTitle {
      if calcMethod == "+/-"{
        displayValue *= -1
      } else if calcMethod == "AC"{
        displayValue = 0
      } else if calcMethod == "%"{
        displayValue *= 0.01
      }
      
//      switch calcMethod {
//        case "AC":
//          displayValue = 0
//          break
//        case "%":
//          displayValue *= 0.01
//          break
//        case "+/-":
//          displayValue *= -1
//          break
//        case "+":
//
//          break
//        case "-":
//
//          break
//        case "*":
//
//          break
//        case "÷":
//
//          break
//        case "=":
//
//          break
//        default:
//          break
//      }
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
