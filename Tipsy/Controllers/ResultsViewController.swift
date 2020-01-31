//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Archit Garg on 31/01/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalAmount : Float = 0
    
    var numberOfPeople : Int = 0
    
    var tipPercentage : Int = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(totalAmount)
        
        settingsLabel.text = "Split between \(numberOfPeople), with \(tipPercentage)% tip"
        
    }
    
    @IBAction func reCalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
