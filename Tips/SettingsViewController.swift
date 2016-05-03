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
  @IBOutlet weak var colorSchemeControl: UISegmentedControl!
  
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var colorLabel: UILabel!
  
  override func viewDidLoad() {
    // load default tip
    updateDefaultTip(UserDefaultHelper.getDefaultTip())
    updateColorScheme(UserDefaultHelper.getIsColorSchemeDark())
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    renderColors(UserDefaultHelper.getIsColorSchemeDark())
  }
  
  func renderColors(isDark: Bool) {
    if isDark {
      self.view.backgroundColor = UIColor.blueColor()
      self.view.tintColor = UIColor.whiteColor()
      
      tipLabel.textColor = UIColor.whiteColor()
      colorLabel.textColor = UIColor.whiteColor()
    }
    else {
      self.view.backgroundColor = UIColor.whiteColor()
      self.view.tintColor = UIColor.blueColor()
      
      tipLabel.textColor = UIColor.blackColor()
      colorLabel.textColor = UIColor.blackColor()
    }
  }
  
  func updateDefaultTip(tipValue: Int) {
    defaultTipControl.selectedSegmentIndex = tipValue
  }
  
  func updateColorScheme(isDark: Bool) {
    var value = 0
    if isDark {
      value = 1
    }
    colorSchemeControl.selectedSegmentIndex = value
  }
  
  @IBAction func onValueChanged(sender: AnyObject) {
    UserDefaultHelper.setDefaultTip(defaultTipControl.selectedSegmentIndex + 1)
  }
  
  @IBAction func colorChanged(sender: AnyObject) {
    let isDark = colorSchemeControl.selectedSegmentIndex == 1
    UserDefaultHelper.setIsColorSchemeDark(isDark)
    renderColors(isDark)
  }
}
