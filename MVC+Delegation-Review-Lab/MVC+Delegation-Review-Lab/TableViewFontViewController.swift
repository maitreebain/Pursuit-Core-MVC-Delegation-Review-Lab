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
    
    
    var fontNum: Int = 12
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    func fontIncrease() {
        sliderControl.minimumValue = 1
        sliderControl.maximumValue = 34
    }
    
    
    @IBAction func UpdateUI(segue: UIStoryboardUnwindSegueSource) {
        guard let cellTableViewController = segue.source as? CellTableView else {
            fatalError("can't find cell")
        }
    }
  
    
}

