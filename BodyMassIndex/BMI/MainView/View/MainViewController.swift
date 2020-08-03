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
    print("clear")
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
    
    // Do any additional setup after loading the view.
    setupUIContainerTop()
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showBmiWheel()
  }
  override func loadView() {
    super.loadView()
    setupTableView()
    
    //    tableView.selectRow(at: , animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    
  }
  
  // MARK: - Setup
  fileprivate func setupTableView() {
    tableView.dataSource = self
  }
  fileprivate func setupUIContainerTop() {
    //    self.weight.text = viewModelTopContainer.myWeight == nil ? "" : String(viewModelTopContainer.myWeight)
    //    self.height.text = viewModelTopContainer.myHeight == nil ? "" : String(viewModelTopContainer.myHeight)
    self.weight.text = viewModelTopContainer.myWeight == nil ? "90" : String(viewModelTopContainer.myWeight)
    self.height.text = viewModelTopContainer.myHeight == nil ? "190" : String(viewModelTopContainer.myHeight)
  }
  fileprivate func showBmiWheel() {
    // build programmatically uiview
    let lmargin: CGFloat = containerBmiWheel.frame.width * 0.02 // margin by default 0.08, best 0.02
    let laxisY: CGFloat = 0
    let lwidth: CGFloat = containerBmiWheel.frame.width
    let lheight: CGFloat = containerBmiWheel.frame.height
    let cgRectBmiWheel = CGRect(x: 0 + lmargin, y: laxisY, width: lwidth - (lmargin * 2), height: lheight) // sets frame
    bmiWheelView = BmiWheel(frame: cgRectBmiWheel)
    containerBmiWheel.addSubview(bmiWheelView) // add it
  }
}


extension MainViewController: UITextFieldDelegate {
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    print("touchesEnded")
    
    if (!(weight.text! == "") && !(height.text! == "")) {
      print("  💟 good 💟")
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
      print("  💟🐝\(#line)💟▓▒░ imc ░▒▓💟",imc,"💟")
    } else {
      print("  💟 not good 💟")
    }
  }
  
  
  
  
  
  
  
  
  
  //  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  //      // get data by BMI the value and Scroll to right data in the table view
  //      for i in 0..<8 {
  //        print(i)
  //        if let r = tableView.cellForRow(at: IndexPath.init(item: i, section: 0)) as? TableViewCellBmi {
  //          r.categorie.textColor = .none
  //          r.difference.textColor = .none
  //          r.backgroundColor = .none
  //        }
  //      }
  //
  //  }
  //  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  //    view.endEditing(true)
  //        // est pas vide alors
  //        if (!(weight.text! == "") && !(height.text! == "")) {
  //          print("1")
  //          let imc = Cal.bmi(tall: Int(height.text!)!, weight: Float(weight.text!)!)
  //          bmiWheelView.animationArrowWith(bmiValue: CGFloat(imc))
  //
  //          // get data by BMI the value and Scroll to right data in the table view
  //          let indexPathRow = SelectBmiInfo.getRightRowByCalculateBmi(withBmi: imc)
  //          let indexPathRowColor = SelectBmiInfo.getRightColorByCalculateBmi(withBmi: imc)
  //
  //          //scroll in to the right index calcalted by the bmi
  //          tableView.selectRow(at: IndexPath.init(item: indexPathRow, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.middle)
  //
  //
  //          // remove reste of color
  //          for i in 0..<8 {
  //                 print(i)
  //                 if let r = tableView.cellForRow(at: IndexPath.init(item: i, section: 0)) as? TableViewCellBmi {
  //                   r.categorie.textColor = .none
  //                   r.difference.textColor = .none
  //                   r.backgroundColor = .none
  //                 }
  //               }
  //
  //          //remove old color selection by default
  //          let row = tableView.cellForRow(at: IndexPath.init(item: indexPathRow, section: 0)) as? TableViewCellBmi
  //          if let r = row {
  //            // reset all color to none for new search
  //            r.selectionStyle = .none
  //              // set new color selection
  //              r.categorie.textColor = indexPathRowColor
  //              r.difference.textColor = indexPathRowColor
  //              r.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1) // gray
  ////            r.selectionStyle = .none
  //          }
  //
  //          print(imc)
  //        } else {
  //          print("2")
  //        }
  //
  //
  //        // logic scroll into
  //
  //
  //
  //        // scroll into
  //    //    tableView.selectRow(at: IndexPath.init(item: 7, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.middle)
  //
  //
  //        // color depends on bmi
  //
  //  }
  
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
  
  // MARK: -
  // TODO: a faire
  // MARK: -
  //  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  //    let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: containerBmiWheel.frame.width, height: 50)) //set these values as necessary
  //      returnedView.backgroundColor = .gray
  //      return returnedView
  //  }
  
  
}

class TableViewCellBmi: UITableViewCell {
  @IBOutlet weak var categorie: UILabel!
  @IBOutlet weak var difference: UILabel!
}
