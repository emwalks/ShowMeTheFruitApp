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
        
        //service need a mock service and real service
        //mockservice just returns an hardcoded object
        class MockFruitDataService: FruitDataService {
            
            func getFruit() -> FruitItem? {
                let fruitItems = [FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)]
                return fruitItems.first
            }
        }
        
        
        
        //presenter
        class FruitListPresenter: FruitListPresenterProtocol {
            private weak var fruitListViewDelegate: FruitListViewDelegate?
            private let fruitDataService: FruitDataService
            
            required init(fruitListViewDelegate: FruitListViewDelegate?, fruitDataService: FruitDataService) {
                self.fruitDataService = fruitDataService
                self.fruitListViewDelegate = fruitListViewDelegate
                showFruitList()
            }
            
   
            func showFruitList() {
                let fruitItem = fruitDataService.getFruit()
                self.fruitListViewDelegate?.setFruit(description: fruitItem?.fruitType ?? "no fruit returned from service")
            }
            
        }
        
        //view
        class MockFruitListView: FruitListViewDelegate {
           
            var fruitListPresenter: FruitListPresenter!
            
            var fruitTypeLabel: String = ""
            
            func setFruit(description:(String)) {
                fruitTypeLabel = description
            }
            
            
        }
        
        
        //arrange (given)
        let mockFruitItem = FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120)
       
        let mockFruitDataService = MockFruitDataService()
        let mockFruitListView = MockFruitListView()
        let fruitListPresenter = FruitListPresenter(fruitListViewDelegate: mockFruitListView, fruitDataService: mockFruitDataService)
        //act (when)
        mockFruitListView.fruitListPresenter = fruitListPresenter
        
        //assert (then)
        let expectedResult = mockFruitItem.fruitType
        let actualResult = mockFruitListView.fruitTypeLabel
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
}

protocol FruitListViewDelegate: class {
    func setFruit(description:String)
}


protocol FruitDataService {
    func getFruit() -> FruitItem?
}

protocol FruitListPresenterProtocol {
    init(fruitListViewDelegate: FruitListViewDelegate?, fruitDataService: FruitDataService)
    func showFruitList()
}
