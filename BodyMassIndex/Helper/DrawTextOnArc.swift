//
//  DrawTextOnArc.swift
//  bmi-wheel
//
//  Created by Eddy R on 04/06/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class DrawTextOnArc {
  init(on layer: CALayer, text: NSAttributedString = NSAttributedString(string: "This is a test string This is a test string This is a test string",attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]), angle: CGFloat = 0, radius: CGFloat = 180, interSpaceLetter:CGFloat = 0, textCenter: Bool = false) {//    self.backgroundColor = UIColor.gray
        var radAngle = angle.radians// calcul radian angle
        let textSize = text.boundingRect(with: CGSize(width: .max, height: .max), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).integral.size // get size fo the string
        
        let perimeter:CGFloat = 2 * .pi * (radius + interSpaceLetter) // perimeter of circle

        let align = textCenter ? CGFloat(2) : CGFloat(0)
        let textAngle: CGFloat = textSize.width / perimeter * align * .pi  // ✘
        
        var textRotation: CGFloat = 0
        var textDirection: CGFloat = 0
        
        if angle > CGFloat(10).radians, angle < CGFloat(170).radians {
          // bottom string
          textRotation = 0.5 * .pi
          textDirection = -2 * .pi
          radAngle += textAngle / 2
        } else {
          // top string
          textRotation = 1.5 * .pi
          textDirection = 2 * .pi
          radAngle -= textAngle / 2
        }
        
        
        // for on each character
        for c in 0..<text.length {
          let letter = text.attributedSubstring(from: NSRange(c..<c+1)) // identify each letter and keep it
          let charSize = letter.boundingRect(with: CGSize(width: .max, height: .max), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).integral.size // get size and other parameter for each characheter
    
          // calcul angle for each letter
          let letterAngle = (charSize.width / perimeter) * textDirection
          let x = radius * cos(radAngle + (letterAngle / 2))
          let y = radius * sin(radAngle + (letterAngle / 2))
          
          // calcul right position
          // draw each char on arc
          let singleChar = drawCharacter(text: letter, frameChar: CGRect(
            x: (layer.frame.size.width / 2) - (charSize.width / 2) + x,
            y: (layer.frame.size.height / 1) - (charSize.height / 2) + y,
            // default y: (layer.frame.size.height / 1) - (charSize.height / 2) + y,
            width: charSize.width,
            height: charSize.height))
          
          // add each character into the layer
          layer.addSublayer(singleChar)
          
          // apply a rotation
          singleChar.transform = CATransform3DMakeAffineTransform(CGAffineTransform(rotationAngle: radAngle - textRotation))
          // update the rotation for the next charater
          radAngle += letterAngle
        }
  }
  
  /** embed char in layer. */
  private func drawCharacter(text: NSAttributedString, frameChar: CGRect)-> CATextLayer {
    let textLayer = CATextLayer()
    
    if (frameChar.origin.x.isNaN && frameChar.origin.x.isNaN) {
      textLayer.frame = CGRect(
        origin: CGPoint(x: 0, y: 0),
        size: frameChar.size)
    } else {
      textLayer.frame = frameChar
    }
    
    textLayer.string = text
    textLayer.alignmentMode = .center
    //      textLayer.contentsScale =
    return textLayer
  }
}

extension CGFloat {
  var degrees: CGFloat {
    return self * (180.0 / .pi)
  } /** Degrees to Radian **/
  var radians: CGFloat {
    return self / 180.0 * .pi
  } /** Radians to Degrees **/
}
