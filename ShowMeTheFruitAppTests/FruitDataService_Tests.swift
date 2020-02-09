//
//  FruitDataService_Tests.swift
//  ShowMeTheFruitAppTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//
//
//import XCTest
//
//
//class FruitDataService_Tests: XCTestCase {
//    
//    func testWhenMockScreenIsNavigatedToAFruitNameIsDisplayedUsingAHTTPRequestToGetData() {
//        
//        //may need to test using UI test - or mock URLSession can't get network request to 
//        
//        //arrange (given)
//        
//        let fruitDataService = FruitDataService()
//        let mockFruitListView = MockFruitListView()
//        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: fruitDataService)
//        //act (when)
//        mockFruitListView.fruitListPresenter = fruitListPresenter
//        
//        //assert (then)
//        let expectedResult = "apple"
//        let actualResult = mockFruitListView.fruitTypeLabelForIndex1
//        
//        XCTAssertEqual(expectedResult, actualResult)
//        
//    }
//    
//}
