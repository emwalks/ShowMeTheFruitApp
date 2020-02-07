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
        //model

        
        //service need a mock service and real service
        //mockservice just returns an hardcoded object
        class MockFruitDataService: FruitDataService {
            
            func getFruit(callBack:(FruitItem?) -> Void) {
                let fruitItems = [FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)]
                callBack(fruitItems.first)
            }
        }
        
        //view
        class MockFruitListView: FruitListViewDelegate {
            func displayFruit(description: String) {
                
            }
            
                        
        }
    
        //presenter
        class FruitListPresenter {
            //initialise with something that conforms to protocols of dataServoce and ViewDelegate
        }
        
        
        //arrange (given)
        let mockFruitItem = FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        //act (when)
        let fruitListPresenter = FruitListPresenter()
        //assert (then)
        let expectedResult = mockFruitItem.fruitType
        let actualResult = fruitListPresenter.something
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
}
                
protocol FruitListViewDelegate {
    func displayFruit(description:String)
}


protocol FruitDataService {
    func getFruit(callBack:(FruitItem?))
}
