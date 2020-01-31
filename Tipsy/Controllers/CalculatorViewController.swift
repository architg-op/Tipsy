//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var stepperLabel: UIStepper!
    
    var finalPct : Float = 0
    
    var finalAmount : Float = 0
    
    var finalSplit : Float = 0
    
    var perPersonSplit : Float = 0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
        } else {
            twentyPctButton.isSelected = true
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text =  String(Int(stepperLabel.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        finalAmount = Float(billTextField.text! ?? "0") as! Float 
        
        if zeroPctButton.isSelected == true {
            finalPct = 0
        } else if tenPctButton.isSelected == true {
            finalPct = 10
        } else {
            finalPct = 20
        }
        
        finalSplit = Float(splitNumberLabel.text!) ?? 0
        
        perPersonSplit = (finalAmount + (finalAmount * finalPct / 100)) / finalSplit
        
        print(perPersonSplit)
        
        performSegue(withIdentifier: "goToResultVC", sender: self)
        
//        print("\(finalAmount)  \(finalPct)  \(finalSplit)")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultVC" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = Int(finalSplit)
            destinationVC.tipPercentage = Int(finalPct)
            destinationVC.totalAmount = perPersonSplit
        }
    }
    
    
    
    
    
    
    

}

