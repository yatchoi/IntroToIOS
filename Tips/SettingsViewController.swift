//
//  SettingsViewController.swift
//  Tips
//
//  Created by Yat Choi on 5/1/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  @IBOutlet weak var defaultTipControl: UISegmentedControl!
  
  override func viewDidLoad() {
    // load default tip
    updateDefaultTip(UserDefaultHelper.getDefaultTip())
  }
  
  func updateDefaultTip(tipValue: Int) {
    defaultTipControl.selectedSegmentIndex = tipValue
  }
  
  @IBAction func onValueChanged(sender: AnyObject) {
    UserDefaultHelper.setDefaultTip(defaultTipControl.selectedSegmentIndex + 1)
  }
}
