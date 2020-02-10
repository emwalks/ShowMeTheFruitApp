//
//  FruitList_UITests.swift
//  ShowMeTheFruitAppUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitList_UITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    let fruitNames = ["apple", "banana", "blueberry", "orange", "pear", "strawberry", "kumquat", "pitaya", "kiwi"]
    

    func testWhenFruitListScreenIsNavigatedToAListOfFruitIsDisplayed() {
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[0])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[1])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[2])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[3])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[4])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[5])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[6])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[7])"].exists)
        XCTAssertTrue(app.tables["FruitListTable"].staticTexts["\(fruitNames[8])"].exists)
    
    }
    
    func testWhenFruitIsSelectedTheFruitDetailScreenIsNavigatedTo() {
        let mockFruitItem = ["apple", 1.49, 1.20] as [Any]
        app.tables["FruitListTable"].staticTexts["apple"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "pricePresented").label, "Price: £\(mockFruitItem[1])")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "weightPresented").label, "Weight: \(mockFruitItem[2]) kg")
       
    }

}
