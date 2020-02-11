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
        let mockFruitItem = FruitItem(type: "mockApple", price: 149, weight: 120)
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let mockScreenNavigationController = MockScreenNavController()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService, screenNavigationController: mockScreenNavigationController)
        //act (when)
        mockFruitListView.fruitListPresenter = fruitListPresenter
        
        //assert (then)
        let expectedResult = mockFruitItem.type
        let actualResult = mockFruitListView.fruitTypeLabelForIndex1
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
    
    func testWhenMockScreenIsNavigatedToMultipleFruitNamesAreDisplayed() {
        let mockFruitItem1 =  FruitItem(type: "mockApple", price: 149, weight: 120)
        let mockFruitItem2 =  FruitItem(type: "mockBanana", price: 149, weight: 120)
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let mockScreenNavigationController = MockScreenNavController()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService, screenNavigationController: mockScreenNavigationController)
        //act (when)
        mockFruitListView.fruitListPresenter = fruitListPresenter
        
        //assert (then)
        let expectedResult1 = mockFruitItem1.type
        let actualResult1 = mockFruitListView.fruitTypeLabelForIndex1
        
        let expectedResult2 = mockFruitItem2.type
        let actualResult2 = mockFruitListView.fruitTypeLabelForIndex2
        
        let expectedResult3 = ""
        let actualResult3 = mockFruitListView.fruitTypeLabelForIndex3
        
        
        XCTAssertEqual(expectedResult1, actualResult1)
        XCTAssertEqual(expectedResult2, actualResult2)
        XCTAssertEqual(expectedResult3, actualResult3)
        
    }
    
    func testThatTheFruitDetailScreenIsNavigatedToViaScreenNavController() {
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let mockScreenNavigationController = MockScreenNavController()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService, screenNavigationController: mockScreenNavigationController)
        
        fruitListPresenter.showFruitDetailsView(fruitTypeSelected: "")
        
        XCTAssertEqual(mockScreenNavigationController.fruitDetailScreen, true)
    }
    
    func testWhenTheSendDisplayStatisticIsCalledTheStatisticURLIsSent(){
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let mockScreenNavigationController = MockScreenNavController()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService, screenNavigationController: mockScreenNavigationController)
        
        fruitListPresenter.sendDisplayStatistic(timeTaken: -1)
        let actualResult = mockFruitDataService.statisticsSent
        
        XCTAssertEqual(actualResult, true)
        
    }
}








