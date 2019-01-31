//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Yu Chieh Lin on 1/29/19.
//  Copyright © 2019 Yu Chieh Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func onTap(_ sender: Any) {
        // dismiss keyboard 
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill count
        let bill = Double(billField.text!) ?? 0
        
        // Array of percentages
        let tipPercentages = [0.15, 0.18, 0.20]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and total 
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }
}

