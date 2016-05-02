//
//  ViewController.swift
//  Tips
//
//  Created by Yat Choi on 4/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
  @IBOutlet weak var numPeopleLabel: UILabel!
  @IBOutlet weak var numPeopleStepper: UIStepper!
  @IBOutlet weak var finalTotalLabel: UILabel!
  
  let TIP_PERCENTAGES = [0.18, 0.2, 0.22]
  
  var numPeople = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    initializeLabels()
    
    // Only pop up the keyboard if amount not yet entered
    if billField.text?._bridgeToObjectiveC().doubleValue == 0 {
      billField.becomeFirstResponder()
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    tipSegmentedControl.selectedSegmentIndex = UserDefaultHelper.getDefaultTip()
    updateLabels()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func initializeLabels() {
    let savedAmount = UserDefaultHelper.getSavedAmount()
    
    if (savedAmount > 0) {
      billField.text = String(format: "%.2f", savedAmount)
    }
    
    tipLabel.text = "$0.00"
    totalLabel.text = "$0.00"
    finalTotalLabel.text = "$0.00"
  }
  
  func updateLabels() {
    let billValue = billField.text!._bridgeToObjectiveC().doubleValue
    let tipValue = TIP_PERCENTAGES[tipSegmentedControl.selectedSegmentIndex]
    
    let tipAmount = billValue * tipValue
    let total = billValue + tipAmount
    let finalTotal = total / Double(numPeople)
    
    tipLabel.text = String(format: "$%.2f", tipAmount)
    totalLabel.text = String(format: "$%.2f", total)
    finalTotalLabel.text = String(format: "$%.2f", finalTotal)
  }
  
  func saveAmount() {
    print("saving \(billField.text!)")
    UserDefaultHelper.setSavedAmount(billField.text!._bridgeToObjectiveC().doubleValue)
  }

  @IBAction func onEditingChanged(sender: AnyObject) {
    updateLabels()
  }
  
  @IBAction func onTipChanged(sender: AnyObject) {
    updateLabels()
  }
  
  @IBAction func onNumPeopleChanged(sender: AnyObject) {
    numPeople = numPeopleStepper.value._bridgeToObjectiveC().integerValue
    numPeopleLabel.text = "\(numPeople)"
    
    updateLabels()
  }
  
  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }
  
}

