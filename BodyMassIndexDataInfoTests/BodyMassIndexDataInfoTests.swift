//
//  BodyMassIndexDataInfoTests.swift
//  BodyMassIndexDataInfoTests
//
//  Created by Eddy R on 01/08/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import XCTest
@testable import BodyMassIndex

class BodyMassIndexDataInfoTests: XCTestCase {
  var selectBmiInfo: SelectBmiInfo = SelectBmiInfo()
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    func testAddition() {
      // arrange = initialisation ( var , objc )
      let x = 20
      let y = 40
      let expected = 60
      
      // act : agir : execute l'action que l'on veux tester (methode autre)
      let actual = x + y
      
      // Assert : auditer verification attentu
      XCTAssertEqual(actual, expected)
    }
  }
  
  func testDataArrayIsCorrectlyChoosed() throws {
      // arrange
    let expected0 = 7
    let expected1 = 6
    let expected2 = 5
    let expected3 = 4
    let expected4 = 3
    let expected5 = 2
    let expected6 = 1
    let expected7 = 0

      // act
    let actual0:Int = selectBmiInfo.calculBmi(bmi: 39.96)
    let actual1:Int = selectBmiInfo.calculBmi(bmi: 34.91)
    let actual2:Int = selectBmiInfo.calculBmi(bmi: 29.91)
    let actual3:Int = selectBmiInfo.calculBmi(bmi: 24.91)
    let actual4:Int = selectBmiInfo.calculBmi(bmi: 18.50)
    let actual5:Int = selectBmiInfo.calculBmi(bmi: 17.00)
    let actual6:Int = selectBmiInfo.calculBmi(bmi: 16.01)
    let actual7:Int = selectBmiInfo.calculBmi(bmi: 15.91)

      // Assert :
    XCTAssertEqual(actual0, expected0)
    XCTAssertEqual(actual1, expected1)
    XCTAssertEqual(actual2, expected2)
    XCTAssertEqual(actual3, expected3)
    XCTAssertEqual(actual4, expected4)
    XCTAssertEqual(actual5, expected5)
    XCTAssertEqual(actual6, expected6)
    XCTAssertEqual(actual7, expected7)
  }
  
}

