//
//  ShowFruitList_Tests.swift
//  ShowMeTheFruitAppTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitListPresenter_Tests: XCTestCase {
    
    //service need a mock service and real service
    //mockservice just returns an hardcoded object
    class MockFruitDataService: FruitDataService {
        
        func getFruit() -> Array<FruitItem?> {
            let arrayOfFruitItems = [
                FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120),
                FruitItem(fruitType: "mockBanana", fruitPriceInPence: 129, fruitWeightInGrams: 80)
            ]
            return arrayOfFruitItems
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
            let arrayOfFruitItems = fruitDataService.getFruit()
            var arrayOfFruitTypes: Array<String?> = []
            arrayOfFruitItems.forEach {
                arrayOfFruitTypes.append($0?.fruitType)
            }
            self.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
        }
        
    }
    
    //view
    class MockFruitListView: FruitListViewDelegate {
        
        fileprivate var fruitListPresenter: FruitListPresenter!
        fileprivate var arrayOfFruitTypes: Array<String?> = []
        
        var fruitTypeLabelForIndex1: String = ""
        var fruitTypeLabelForIndex2: String = ""
        var fruitTypeLabelForIndex3: String = ""
        
        func setFruit(arrayOfFruitTypes: Array<String?>) {
            self.arrayOfFruitTypes = arrayOfFruitTypes
            if arrayOfFruitTypes.count != 0 {
                fruitTypeLabelForIndex1 = arrayOfFruitTypes[0] ?? ""
                fruitTypeLabelForIndex2 = arrayOfFruitTypes[1] ?? ""
                fruitTypeLabelForIndex3 = ""
            } else {
                fruitTypeLabelForIndex1 =  ""
                fruitTypeLabelForIndex2 =  ""
                fruitTypeLabelForIndex3 =  ""
            }
            
        }
    }
    
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


protocol FruitListViewDelegate: class {
    func setFruit(arrayOfFruitTypes: Array<String?>)
}


protocol FruitDataService {
    func getFruit() -> Array<FruitItem?>
}

protocol FruitListPresenterProtocol {
    init(fruitListViewDelegate: FruitListViewDelegate?, fruitDataService: FruitDataService)
    func showFruitList()
}
