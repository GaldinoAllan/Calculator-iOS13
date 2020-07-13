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
  
  @IBOutlet weak var displayLabel: UILabel!
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    //What should happen when a non-number button is pressed
  }
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    //What should happen when a number is entered into the keypad
    
    sender.currentTitle
  }
}
