//
//  TableViewFontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Maitree Bain on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class TableViewFontViewController: UIViewController {

    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet weak var fontSize: UILabel!
    
    
    var fontNum: Double = 12 {
        didSet {
            fontSize.text = "Preview Font Size: \(round(stepperControl.value))"
        }
    }
    
    var sliderFont: Float = 12 {
        didSet {
            fontSize.text = "Preview Font Size: \(round(sliderControl.value))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderFontIncrease()
        stepperFontIncrease()
    }

    
    func sliderFontIncrease() {
        sliderControl.minimumValue = 1.0
        sliderControl.maximumValue = 50.0
        sliderControl.value = 12.0
    }
    
    func stepperFontIncrease() {
        stepperControl.minimumValue = 1.0
        stepperControl.maximumValue = 50.0
        stepperControl.value = 12.0
        stepperControl.stepValue = 1.0
    }
  
    
    @IBAction func sliderChange(_ sender: UISlider) {
        sliderFont = sender.value
        stepperControl.value = Double(sender.value)
        
    }
    
    
    @IBAction func stepperChange(_ sender: UIStepper) {
        fontNum = sender.value
        sliderControl.value = Float(sender.value)
    }
    
}

