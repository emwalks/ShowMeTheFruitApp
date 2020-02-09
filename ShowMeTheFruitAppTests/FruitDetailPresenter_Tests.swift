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
        
        class FruitDetailPresenter {
            
            private weak var fruitDetailViewDelegate: FruitDetailViewDelegateProtocol?
            private let fruitDataService: FruitDataServiceProtocol
            
           required init(fruitDetailViewDelegate: FruitDetailViewDelegateProtocol?, fruitDataService: FruitDataServiceProtocol) {
               self.fruitDataService = fruitDataService
               self.fruitDetailViewDelegate = fruitDetailViewDelegate
           }
            
            func showFruitDetail(type: String) {
               fruitDataService.getFruitDetail(type: type){ [weak self] fruit in

                if let fruit = fruit {
                        self?.fruitDetailViewDelegate?.setFruitDetail(fruitSelected: fruit)
                     }
                 }
            }
        }
       
        
        class MockFruitDetailView: FruitDetailViewDelegateProtocol {
            
            var fruitDetailPresenter : FruitDetailPresenter!
            var fruitSelected: FruitItem? = nil
            
            var fruitPriceLabel: Double = -1
            var fruitWeightLabel: Double = -1
            
            func setFruitDetail(fruitSelected: FruitItem?) {
                self.fruitSelected = fruitSelected
                self.fruitPriceLabel = fruitSelected!.priceInPounds
                self.fruitWeightLabel = fruitSelected!.weightInKilos
            }
        }
        
        
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

protocol FruitDetailViewDelegateProtocol: class {
   func setFruitDetail(fruitSelected: FruitItem?)
}
