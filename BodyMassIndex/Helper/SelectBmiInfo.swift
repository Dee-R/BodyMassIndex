//
//  SelectBmiInfo.swift
//  BodyMassIndex
//
//  Created by Eddy R on 01/08/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class SelectBmiInfo {
  func calculBmi(bmi:Double) -> Int {
    if        (bmi >= 39.96) {
      return 7
    } else if (bmi >= 34.91) {
      return 6
    } else if (bmi >= 29.91) {
      return 5
    } else if (bmi >= 24.91) {
      return 4
    } else if (bmi >= 18.50) {
      return 3
    } else if (bmi >= 17.00) {
      return 2
    } else if (bmi >= 16.01) {
      return 1
    }
    return 0
  }
  
  
  static func getRightRowByCalculateBmi(withBmi bmi:Float) -> Int {
    if        (bmi >= 39.96) {
      return 7
    } else if (bmi >= 34.91) {
      return 6
    } else if (bmi >= 29.91) {
      return 5
    } else if (bmi >= 25.01) {
      return 4
    } else if (bmi >= 18.50) {
      return 3
    } else if (bmi >= 17.00) {
      return 2
    } else if (bmi >= 16.01) {
      return 1
    }
    return 0
  }
  static func getRightColorByCalculateBmi(withBmi bmi:Float) -> UIColor {
    let colorRed = UIColor.init(red: 188/255, green: 64/255, blue: 64/255, alpha: 1)
    let colorBlue = UIColor.init(red: 57/255, green: 209/255, blue: 230/255, alpha: 1)
    let colorGreen = UIColor.init(red: 64/255, green: 188/255, blue: 100/255, alpha: 1)
    if        (bmi >= 39.96) {
      return colorRed
    } else if (bmi >= 34.91) {
      return colorRed
    } else if (bmi >= 29.91) {
      return colorRed
    } else if (bmi >= 25.01) {
      return colorRed
    } else if (bmi >= 18.50) {
      return colorGreen
    } else if (bmi >= 17.00) {
      return colorBlue
    } else if (bmi >= 16.01) {
      return colorBlue
    }
    return colorBlue
  }
}
