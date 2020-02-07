//
//  ShowFruitList_Tests.swift
//  ShowMeTheFruitAppTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitListPresenter_Tests: XCTestCase {

    
    func testWhenMockScreenIsNavigatedToAFruitNameIsDisplayed() {
                
        //arrange (given)
        let mockFruitItem = FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService)
        //act (when)
        mockFruitListView.fruitListPresenter = fruitListPresenter
        
        //assert (then)
        let expectedResult = mockFruitItem.fruitType
        let actualResult = mockFruitListView.fruitTypeLabelForIndex1
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
    
    func testWhenMockScreenIsNavigatedToMultipleFruitNamesAreDisplayed() {
        let mockFruitItem1 = FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)
        let mockFruitItem2 = FruitItem(fruitType: "mockBanana", fruitPriceInPence: 120, fruitWeightInGrams: 80)
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService)
        //act (when)
        mockFruitListView.fruitListPresenter = fruitListPresenter
        
        //assert (then)
        let expectedResult1 = mockFruitItem1.fruitType
        let actualResult1 = mockFruitListView.fruitTypeLabelForIndex1
        
        let expectedResult2 = mockFruitItem2.fruitType
        let actualResult2 = mockFruitListView.fruitTypeLabelForIndex2
        
        let expectedResult3 = ""
        let actualResult3 = mockFruitListView.fruitTypeLabelForIndex3
               
        
        XCTAssertEqual(expectedResult1, actualResult1)
        XCTAssertEqual(expectedResult2, actualResult2)
        XCTAssertEqual(expectedResult3, actualResult3)
        
    }
}








