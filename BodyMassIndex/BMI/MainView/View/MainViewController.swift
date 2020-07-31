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
  @IBOutlet weak var containerBmiWheel: UIView! // from SB
  var bmiWheelView: BmiWheel! = BmiWheel(frame: CGRect.zero)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showBmiWheel()
  }
  
  // Setup first Container
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

