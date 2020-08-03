//
//  ViewController.swift
//  BodyMassIndex
//
//  Created by Eddy R on 31/07/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//
import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
  //  ivar
  private var viewModelTopContainer = ViewModelTopContainer()
  @IBOutlet weak var mainTitle: UILabel!
  @IBOutlet weak var weight: UITextField!
  @IBOutlet weak var height: UITextField!
  @IBOutlet weak var containerBmiWheel: UIView! // from SB
  var bmiWheelView: BmiWheel! = BmiWheel(frame: CGRect.zero)
  @IBOutlet weak var containerBmiInfo: UIView!
  @IBOutlet weak var tableView: UITableView!
  let dataBmi = [
    ["Very below a normal weight", "< 16.00"],
    ["Below normal weight", "16.00 - 16.90"],
    ["Insufficient weight", "17.00 - 18.49"],
    ["Normal", "18.50 - 25.00"],
    ["Overweight", "25.01 - 29.90"],
    ["Obesity class I", "29.91 - 34.90"],
    ["Obesity class II", "34.91 - 38.90"],
    ["Obesity class III", "> 40.00"],
  ]
    
  @IBAction func resetStyleTableViewRow(_ sender: Any) {
    // clear data
    for i in 0..<dataBmi.count {
      let cellForRow = tableView.cellForRow(at: IndexPath.init(row: i, section: 0)) as? TableViewCellBmi
      // change color row selected
      cellForRow?.contentView.backgroundColor = UIColor.clear
      cellForRow?.categorie.textColor = .black
      cellForRow?.difference.textColor = .black
    }
  }
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUIContainerTop()
    setupUIContainerBottom()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showBmiWheel()
  }
  override func loadView() {
    super.loadView()
    setupTableView()
  }
  
  // MARK: - Setup
  fileprivate func setupTableView() {
    tableView.dataSource = self
  }
  fileprivate func setupUIContainerTop() {
    //    self.weight.text = viewModelTopContainer.myWeight == nil ? "" : String(viewModelTopContainer.myWeight)
    //    self.height.text = viewModelTopContainer.myHeight == nil ? "" : String(viewModelTopContainer.myHeight)
    self.weight.text = viewModelTopContainer.myWeight == nil ? "" : String(viewModelTopContainer.myWeight)
    self.height.text = viewModelTopContainer.myHeight == nil ? "" : String(viewModelTopContainer.myHeight)
  }
  func setupUIContainerBottom() {
    tableView.separatorStyle = .none
    tableView.isHidden = true
  }
  fileprivate func showBmiWheel() {
    // build programmatically uiview
    let lmargin: CGFloat = containerBmiWheel.frame.width * 0.02 // margin by default 0.08, best 0.02
    let laxisY: CGFloat = 0
    let lwidth: CGFloat = containerBmiWheel.frame.width
    let lheight: CGFloat = containerBmiWheel.frame.height
    let cgRectBmiWheel = CGRect(x: 0 + lmargin, y: laxisY, width: lwidth - (lmargin * 2), height: lheight) // sets frame
    bmiWheelView = BmiWheel(frame: cgRectBmiWheel)
    containerBmiWheel.addSubview(bmiWheelView)
  }
}

extension MainViewController: UITextFieldDelegate {
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    if (!(weight.text! == "") && !(height.text! == "")) {
      tableView.isHidden = false
      // calculate bmi
      let imc = Cal.bmi(tall: Int(height.text!)!, weight: Float(weight.text!)!)
      let rowIndexPath = SelectBmiInfo.getRightRowByCalculateBmi(withBmi: imc)
      
      //scroll to right row
      tableView.selectRow(at: IndexPath.init(row: rowIndexPath, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.middle)
      
      // change color row selected
      let cellForRow = tableView.cellForRow(at: IndexPath.init(row: rowIndexPath, section: 0)) as? TableViewCellBmi
      cellForRow?.contentView.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
      cellForRow?.categorie.textColor = SelectBmiInfo.getRightColorByCalculateBmi(withBmi: imc)
      cellForRow?.difference.textColor = SelectBmiInfo.getRightColorByCalculateBmi(withBmi: imc)
      
      // animation
      bmiWheelView.animationArrowWith(bmiValue: CGFloat(imc))
    }
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataBmi.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCellBmi
    customCell.categorie.text = dataBmi[indexPath.row][0]
    customCell.difference.text = dataBmi[indexPath.row][1]
    //    customCell.categorie.textColor = UIColor.red
    return customCell
  }
}

class TableViewCellBmi: UITableViewCell {
  @IBOutlet weak var categorie: UILabel!
  @IBOutlet weak var difference: UILabel!
}
