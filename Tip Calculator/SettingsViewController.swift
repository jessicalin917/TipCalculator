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
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    
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
    // set strings for slider positions
    let sliderPos1 = "sliderPos1"
    let sliderPos2 = "sliderPos2"
    let sliderPos3 = "sliderPos3"
    
    @IBAction func changeTip1(_ sender: UISlider) {
        // update label
        tip1Label.text = String(format: "%.0f", sender.value) + "%"
        
        // update defaults
        defaults.set(sender.value, forKey: sliderPos1)
        customizeTip( percent: Double(sender.value), index: 0 )
        defaults.synchronize()
    }
    
    @IBAction func changeTip2(_ sender: UISlider) {
        // update label
        tip2Label.text = String(format: "%.0f", sender.value) + "%"
        
        // update defaults
        defaults.set(sender.value, forKey: sliderPos2)
        customizeTip( percent: Double(sender.value), index: 1 )
        defaults.synchronize()
    }
    
    @IBAction func changeTip3(_ sender: UISlider) {
        // update label
        tip3Label.text = String(format: "%.0f", sender.value) + "%"
        
        // update defaults
        defaults.set(sender.value, forKey: sliderPos3)
        customizeTip( percent: Double(sender.value), index: 2 )
        defaults.synchronize()
    }
    
    func customizeTip( percent: Double, index: Int ) {
        var currentTip: String = ""
        
        // specify string
        if index == 0 {
            currentTip  = customTip1
        } else if index == 1 {
            currentTip = customTip2
        } else if index == 2 {
            currentTip = customTip3
        }
        
        // update tip array
        let newTip = percent / 100
        tipPercentages[index] = newTip
        
        // updates defaults
        defaults.set(newTip, forKey: currentTip)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDefaults()
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
        
        // set tip labels to value
        tip1Label.text = String(format: "%.0f", (tip1 * 100)) + "%"
        tip2Label.text = String(format: "%.0f", (tip2 * 100)) + "%"
        tip3Label.text = String(format: "%.0f", (tip3 * 100)) + "%"
        
        
        var sliderVal1 = defaults.float(forKey: sliderPos1)
        var sliderVal2 = defaults.float(forKey: sliderPos2)
        var sliderVal3 = defaults.float(forKey: sliderPos3)
        
        if sliderVal1 == 0 {
            sliderVal1 = Float(default1)
        }
        if sliderVal2 == 0 {
            sliderVal2 = Float(default2)
        }
        if sliderVal3 == 0 {
            sliderVal3 = Float(default3)
        }
        
        // set slider values
        slider1.value = sliderVal1
        slider2.value = sliderVal2
        slider3.value = sliderVal3
        
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
