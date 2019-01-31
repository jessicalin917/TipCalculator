//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Yu Chieh Lin on 1/30/19.
//  Copyright © 2019 Yu Chieh Lin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Label: UILabel!
    
    // @IBOutlet weak var defaultTips: UISegmentedControl!
    
    // Default tip percentages that are initially set
    var tipPercentages = [0.15, 0.18, 0.2]
    
    // Default tip percentage that is currently being used
    var tipPercent = 0.0
    
    // Default tip values
    let defaultTip1 = 0.15
    let defaultTip2 = 0.18
    let defaultTip3 = 0.20
    
    let customTip1 = "customTip1"
    let customTip2 = "customTip2"
    let customTip3 = "customTip3"
    
    let tipPercentArray = "tipPercentArray"
    
    // Used to save and load saved values
    let defaults = UserDefaults.standard
    
    
    @IBAction func changeTip1Slider(_ sender: UISlider) {
        // get value
        let value = sender.value
        
        // change label
        tip1Label.text = String(format: "%.0f", value) + "%"
        
        // update defaults
        defaults.set(Double(value), forKey: customTip1)
        setPercent(percent: Double(value), index: 0);
    }
    
    func setPercent( percent: Double, index: Int) {
        // change tip value of segmented control
        // defaultTips.setTitle((String(format: "%.0f", percent) + "%"), forSegmentAt: index)
        
        // calculate tip decimal
        let tipPercent = percent / 100
        
        // update array
        tipPercentages[index] = tipPercent
        
        // update defaults array
        defaults.set(tipPercentages, forKey: tipPercentArray)
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTips()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadTips() {
        var tip1 = tipPercentages[0]
        
        if var tip1 = defaults.object(forKey: "customTip1") as? Double {
            tip1 = defaults.double(forKey: customTip1)
        }
        
        
        // update array
        tipPercentages[0] = tip1 / 100
        
        // set segment control
        // defaultTips.setTitle((String(format: "%.0f", tip1) + "%"), forSegmentAt: 0)
        
        // set text fields
        tip1Label.text = String(format: "%.0f" + "%", tip1)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
