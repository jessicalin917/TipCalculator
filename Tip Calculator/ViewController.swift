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
    
    // default value array
    var tipPercentages = [0.15, 0.18, 0.20]
    
    // slider defaults
    let default1 = 15
    let default2 = 18
    let default3 = 20
    
    let defaults = UserDefaults.standard
    // set strings for tip percentages
    let customTip1 = "customTip1"
    let customTip2 = "customTip2"
    let customTip3 = "customTip3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
        loadDefaults()
    }
   
    @IBAction func onTap(_ sender: Any) {
        // dismiss keyboard 
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill count
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and total 
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func loadDefaults() {
        // load the defaults' tips
        var tip1 = defaults.double(forKey: customTip1)
        var tip2 = defaults.double(forKey: customTip2)
        var tip3 = defaults.double(forKey: customTip3)
        
        // if null, set them to defaults
        if tip1 == 0 {
            tip1 = tipPercentages[0]
        }
        
        if tip2 == 0 {
            tip2 = tipPercentages[1]
        }
        
        if tip3 == 0 {
            tip3 = tipPercentages[2]
        }
        
        // update array
        tipPercentages[0] = tip1
        tipPercentages[1] = tip2
        tipPercentages[2] = tip3
        
        // set tip control
        tipControl.setTitle(String(format: "%.0f", (tip1 * 100)) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.0f", (tip2 * 100)) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.0f", (tip3 * 100)) + "%", forSegmentAt: 2)
        
    }
}

