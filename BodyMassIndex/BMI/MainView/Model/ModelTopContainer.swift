//
//  ModelTopContainer.swift
//  bmi-wheel
//
//  Created by Eddy R on 03/06/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation

class ModelTopContainer {
  var age: Int? = nil
  var weight: Int?
  var height: Int?
  init(withAge age: Int? = nil, weight: Int? = nil, height: Int? = nil) {
    self.age = age
    self.weight = weight
    self.height = height
  }
}
