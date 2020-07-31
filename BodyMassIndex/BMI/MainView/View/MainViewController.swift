//
//  ViewController.swift
//  BodyMassIndex
//
//  Created by Eddy R on 31/07/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//
// p parameter
// l local
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var mainTitle: UILabel!
  @IBOutlet weak var weight: UITextField!
  @IBOutlet weak var height: UITextField!
  
  @IBOutlet weak var containerBmiWheel: UIView! // from SB
  
  var bmiWheelView: BmiWheel! = BmiWheel(frame: CGRect.zero)
  
  private var viewModelTopContainer = ViewModelTopContainer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupUIContainerTop()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showBmiWheel()
  }
  
  // Setup first Container
  fileprivate func setupUIContainerTop() {
//    self.weight.text = viewModelTopContainer.myWeight == nil ? "" : String(viewModelTopContainer.myWeight)
//    self.height.text = viewModelTopContainer.myHeight == nil ? "" : String(viewModelTopContainer.myHeight)
    self.weight.text = viewModelTopContainer.myWeight == nil ? "90" : String(viewModelTopContainer.myWeight)
    self.height.text = viewModelTopContainer.myHeight == nil ? "190" : String(viewModelTopContainer.myHeight)

  }
  
  // Setup second Container
  func showBmiWheel() {
    // build programmatically uiview
    let lmargin: CGFloat = containerBmiWheel.frame.width * 0.02 // margin by default 0.08, best 0.02
    let laxisY: CGFloat = 0
    let lwidth: CGFloat = containerBmiWheel.frame.width
    let lheight: CGFloat = containerBmiWheel.frame.height
    let cgRectBmiWheel = CGRect(x: 0 + lmargin, y: laxisY, width: lwidth - (lmargin * 2), height: lheight) // sets frame
    bmiWheelView = BmiWheel(frame: cgRectBmiWheel)
    containerBmiWheel.addSubview(bmiWheelView) // add it
  }
  // Setup last Container
}






extension MainViewController: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    // est pas vide alors
    if (!(weight.text! == "") && !(height.text! == "")) {
      print("1")
      let imc = Cal.bmi(tall: Int(height.text!)!, weight: Float(weight.text!)!)
      bmiWheelView.animationArrowWith(bmiValue: CGFloat(imc))
      print(imc)
    } else {
      print("2")
    }
    
  
    
  }
}

