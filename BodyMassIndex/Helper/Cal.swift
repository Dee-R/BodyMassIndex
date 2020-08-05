//
//  Bmi.swift
//  bmi-wheel
//
//  Created by Eddy R on 05/06/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation
class Cal {
  static func bmi(tall:Int, weight: Float) -> Float {
    let textTall :String = String(tall)
    let countTall = textTall.count
    var zeroUnit = "1"
    for _ in 1..<countTall{
      zeroUnit.append("0")
    }
    
    var taille: Float = Float(tall)
    let kg: Float = weight
    
    let zeroOk = Float(zeroUnit)
    guard let zeroOkk = zeroOk else {
      return taille
    }
    
    taille = taille / zeroOkk
    
    // 27,4 = kg / taille ^ 2
    let result:Double = Double(kg / (taille * taille))
    let resultRouded = Float( round(result*100)/100 )
    if resultRouded >= 40.00 {
      return Float(40)
    } else if resultRouded <= 16.00 {
      return Float(16)
    } else {
      return Float( round(result*100)/100 )
    }
  }
}
