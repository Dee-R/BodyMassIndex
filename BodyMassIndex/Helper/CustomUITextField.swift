//
//  CustomUITextField.swift
//  BodyMassIndex
//
//  Created by Eddy R on 01/08/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  var enableLongPressActions = false
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    return enableLongPressActions
  }
}
