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
        XCTAssertEqual(app.tables["FruitListTable"].cells.children(matching: .other).element(boundBy: 0).label, fruitNames[0])
    }

}
