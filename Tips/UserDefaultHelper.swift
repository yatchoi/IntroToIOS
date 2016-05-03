//
//  UserDefaultHelper.swift
//  Tips
//
//  Created by Yat Choi on 5/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//
import UIKit

class UserDefaultHelper {
  static let DefaultTipValue = 1
  static let DefaultTipMemoryKey = "default_tip_key"
  static let SavedAmountMemoryKey = "saved_amount_key"
  static let AmountLastSavedAtMemoryKey = "amount_last_saved_at_key"
  static let SavedNumPeopleMemoryKey = "saved_num_people_key"
  static let IsColorSchemeDarkMemoryKey = "is_color_scheme_dark_key"
  
  static let SecondsToFlushSavedAmount = 10 * 60 // 10 minutes

  /*
   getDefaultTip: Because integerForKey will return 0 if the key is empty,
   lets have the NSUserDefault values range from 1-3.
   When returning the actual value, subtract 1
   */
  static func getDefaultTip() -> Int {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let defaultValue = defaults.integerForKey(DefaultTipMemoryKey)
    
    if (defaultValue == 0) {
      return DefaultTipValue
    }
    
    return defaultValue - 1
  }
  
  static func setDefaultTip(value: Int) {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setInteger(value, forKey: DefaultTipMemoryKey)
    defaults.synchronize()
  }

  static func getSavedAmount() -> Double {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let amountLastSavedAt = defaults.objectForKey(AmountLastSavedAtMemoryKey)
    
    if (amountLastSavedAt == nil) {
      return 0
    }
    
    let flushTime = NSDate().dateByAddingTimeInterval(SecondsToFlushSavedAmount._bridgeToObjectiveC().doubleValue * -1)
    
    let compare = flushTime.compare(amountLastSavedAt as! NSDate)
    if (compare == NSComparisonResult.OrderedDescending) {
      return 0
    }
    
    return defaults.doubleForKey(SavedAmountMemoryKey)
  }
  
  static func setSavedAmount(value: Double) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(value, forKey: SavedAmountMemoryKey)
    defaults.synchronize()
  }
  
  static func getSavedNumPeople() -> Int {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let amountLastSavedAt = defaults.objectForKey(AmountLastSavedAtMemoryKey)
    
    if (amountLastSavedAt == nil) {
      return 1
    }
    
    let flushTime = NSDate().dateByAddingTimeInterval(SecondsToFlushSavedAmount._bridgeToObjectiveC().doubleValue * -1)
    
    let compare = flushTime.compare(amountLastSavedAt as! NSDate)
    if (compare == NSComparisonResult.OrderedDescending) {
      return 1
    }
    
    let numSavedPeople = defaults.integerForKey(SavedNumPeopleMemoryKey)
    if numSavedPeople == 0 {
      return 1
    }
    else {
      return numSavedPeople
    }
  }
  
  static func setSavedNumPeople(value: Int) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(value, forKey: SavedNumPeopleMemoryKey)
    defaults.synchronize()
  }
  
  static func updateAmountLastSavedAt() {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(NSDate(), forKey: AmountLastSavedAtMemoryKey)
    defaults.synchronize()
  }
  
  static func getIsColorSchemeDark() -> Bool {
    let defaults = NSUserDefaults.standardUserDefaults()
    return defaults.boolForKey(IsColorSchemeDarkMemoryKey)
  }
  
  static func setIsColorSchemeDark(value: Bool) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setBool(value, forKey: IsColorSchemeDarkMemoryKey)
    defaults.synchronize()
  }

}
