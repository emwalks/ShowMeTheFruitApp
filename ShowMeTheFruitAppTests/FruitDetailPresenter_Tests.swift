//
//  FruitDetailPresenter_Tests.swift
//  ShowMeTheFruitAppTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitDetailPresenter_Tests: XCTestCase {
    
    func testWhenMockShowDetailScreenIsNavigatedToTheFruitDetailsAreDisplayed() {
        
        //arrange (given)
        let mockFruitItemSelected = FruitItem(type: "mockApple", price: 149, weight: 120)
        
        let mockFruitDataService = MockFruitDataService()
        let mockFruitDetailView = MockFruitDetailView()
        let fruitDetailPresenter = FruitDetailPresenter(fruitDetailViewDelegate: mockFruitDetailView, fruitDataService: mockFruitDataService)
        //act (when)
        fruitDetailPresenter.showFruitDetail(type: mockFruitItemSelected.type)
        //assert (then)
        let expectedPrice = mockFruitItemSelected.priceInPounds
        let actualPrice = mockFruitDetailView.fruitPriceLabel
        
        let expectedWeight = mockFruitItemSelected.weightInKilos
        let actualWeight = mockFruitDetailView.fruitWeightLabel
        
        XCTAssertEqual(expectedPrice, actualPrice)
        XCTAssertEqual(expectedWeight, actualWeight)
        
    }
    
}

