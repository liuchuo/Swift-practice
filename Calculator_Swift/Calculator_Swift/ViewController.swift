//
//  ViewController.swift
//  Calculator_Swift
//
//  Created by 欣 陈 on 15/9/10.
//  Copyright (c) 2015年 欣 陈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var logic : CalcLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainLabel.text = "0"
        logic = CalcLogic()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        logic = nil
    }

    @IBAction func operandPressed(sender: AnyObject) {
        var btn : UIButton = sender as! UIButton
        mainLabel.text = logic.calculateByTag(btn.tag, withMainLabelString: mainLabel.text)
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
        var btn : UIButton = sender as! UIButton
        mainLabel.text = logic.calculateByTag(btn.tag, withMainLabelString: mainLabel.text)
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        mainLabel.text = "0"
        logic.clear()
    }
    
    @IBAction func decimalPressed(sender: AnyObject) {
        if logic.doesStringContainDecimal(mainLabel.text) == false {
            let string = mainLabel.text + "."
            mainLabel.text = string
        }
    }

    @IBAction func numberButtonPressed(sender: AnyObject) {
        var btn : UIButton = sender as UIButton
        mainLabel.text = logic.updateMainLabelStringByNumberTag(btn.tag, withMainLabelString: mainLabel.text!)
    }
}

