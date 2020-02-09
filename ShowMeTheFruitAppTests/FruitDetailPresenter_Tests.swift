////
////  FruitDetailPresenter_Tests.swift
////  ShowMeTheFruitAppTests
////
////  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
////  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
////
//
//import XCTest
//
//class FruitDetailPresenter_Tests: XCTestCase {
//    
//    func testWhenMockShowDetailScreenIsNavigatedToTheFruitDetailsAreDisplayed() {
//        
//        class FruitDetailPresenter {
//            
//        }
//       
//        
//        class MockFruitDetailView {
//            
//        }
//        
//        //arrange (given)
//        let mockFruitItem = FruitItem(type: "mockApple", price: 149, weight: 120)
//        
//        let mockFruitDataService = MockFruitDataService()
//        let mockFruitDetailView = MockFruitDetailView()
//        let fruitDetailPresenter = FruitDetailPresenter(mockFruitDetailView: mockFruitDetailView, fruitDataService: mockFruitDataService)
//        //act (when)
//        mockFruitDetailView.fruitDetailPresenter = fruitDetailPresenter
//        
//        //assert (then)
//        let expectedPrice = mockFruitItem.priceInPounds
//        let actualPrice = mockFruitDetailView.fruitPriceLabel
//        
//        let expectedWeight = mockFruitItem.weightInKilos
//        let actualWeight = mockFruitDetailView.fruitWeightLabel
//        
//        XCTAssertEqual(expectedPrice, actualPrice)
//        XCTAssertEqual(expectedWeight, actualWeight)
//        
//    }
//    
//}
