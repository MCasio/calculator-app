//
//  ViewController.swift
//  Calculator
//
//  Created by Amr Mohamed on 7/3/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            displayLabel.text = String(sender.tag-1)
            numberOnScreen = Double(displayLabel.text!)!
            performingMath = false
        } else {
            displayLabel.text = displayLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(displayLabel.text!)!
            
        }
        
        
    }
    
    
    @IBAction func buttons(_ sender: Any) {
        
        if displayLabel.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16 {
            previousNumber = Double(displayLabel.text!)!
            
            switch (sender as AnyObject).tag {
            case 12:   //division
                displayLabel.text = "/"
            case 13: // multiblication
                displayLabel.text = "*"
            case 14: //substraction
                displayLabel.text = "-"
            case 15: //addition
                displayLabel.text = "+"
            default:
                break
            }
            operation = (sender as AnyObject).tag
            performingMath = true
        }
        else if (sender as AnyObject).tag == 16 {
            switch operation {
                case 12:
                displayLabel.text = String(previousNumber / numberOnScreen)
                case 13:
                displayLabel.text = String(previousNumber * numberOnScreen)
                case 14:
                displayLabel.text = String(previousNumber - numberOnScreen)
                case 15:
                displayLabel.text = String(previousNumber + numberOnScreen)
            default:
                break
            }
        }
        else if (sender as AnyObject).tag == 11 {
            displayLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

