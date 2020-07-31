//
//  CalculateNeedle.swift
//  bmi-wheel
//
//  Created by Eddy R on 21/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation

class CalculNeedle {
  init() {
    
  }
  static func calculAndScale(imc: Float) -> Float {
    let a: [Float] = [16.0, 18.5]
     let b: [Float] = [18.5, 25]
     let c: [Float] = [25, 40]
     
    if imc < 16 {
      return 0
    }
    if imc <= a[1] {
      let old = (imc - a[0]) / (a[1] - a[0])
      let new = ((60 - 0) * old) + 0
      return new
    }
    if (imc <= b[1]) {
      let old = (imc - b[0]) / (b[1] - b[0])
      let new = ((120 - 60) * old) + 60
      return new
      
    }
    if (imc <= c[1]) {
      let old = (imc - c[0]) / (c[1] - c[0])
      let new = ((180 - 120) * old) + 120
      return new
    }
    if imc > 40 {
      return 180
    }
    return 0
  }
}
