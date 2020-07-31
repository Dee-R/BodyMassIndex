//
//  MainVM.swift
//  bmi-wheel
//
//  Created by Eddy R on 29/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class ViewModelTopContainer {
  private var dataModel: ModelTopContainer! = nil
  private (set) var myAge, myWeight, myHeight: Int!
  func viewDidLoad() {
    // ✔︎
//    print("\(#line) ▓ ( ˘ ³˘)♥ ▓  \(showClass) => func \(#function)")
    configurationDataModel()
    configurationOutLet()
  }
  
  // ✔︎
  func configurationDataModel() {
    // sac medic = gelule vide ( poudre medicament) // hydrate
    dataModel = ModelTopContainer(withAge: nil, weight: nil, height: nil)
  }
  func configurationOutLet() {
    myAge = dataModel.age
    myWeight = dataModel.weight
    myHeight = dataModel.height
  }
}


extension ViewModelTopContainer {
  private var showClass: String {
    return String(describing: type(of: self))
  }
}
