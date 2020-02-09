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
        sleep(5)
    }
    
    let fruitNames = ["apple", "banana", "blueberry", "orange", "pear", "strawberry", "kumquat", "pitaya", "kiwi"]
    

    func testWhenFruitListScreenIsNavigatedToAListOfFruitIsDisplayed() {
        
        let firstCell =  app.tables["logbookView"].cells.children(matching: .other).element(boundBy: 0)
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 1))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 6))
        start.press(forDuration: 0, thenDragTo: finish)
    
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

}
