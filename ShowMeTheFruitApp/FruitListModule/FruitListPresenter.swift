//
//  FruitListPresenter.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation


class FruitListPresenter: FruitListPresenterProtocol {
    
    private weak var fruitListViewDelegate: FruitListViewDelegateProtocol?
    private let fruitDataService: FruitDataServiceProtocol
    private var screenNavigationController: ScreenNavigationControllerProtocol
    
    required init(fruitListViewDelegate: FruitListViewDelegateProtocol?, fruitDataService: FruitDataServiceProtocol,  screenNavigationController: ScreenNavigationControllerProtocol) {
        self.fruitDataService = fruitDataService
        self.fruitListViewDelegate = fruitListViewDelegate
        self.screenNavigationController = screenNavigationController
        showFruitList()
    }
    
    
    func showFruitList() {
        // this is a trailing closure
        fruitDataService.getFruits { [weak self] result  in
            
            var arrayOfFruitTypes: Array<String?> = []
            result.forEach {
                arrayOfFruitTypes.append($0?.type)
            }
            self?.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
        }
    }
    
    func sendDisplayStatistics(timeTaken: TimeInterval) {
        let displayEventURL = fruitDataService.displayEvent(timeTaken: timeTaken)
        fruitDataService.sendStatistics(event: displayEventURL)
    }
    
    func showFruitDetailsView(fruitTypeSelected: String){
        screenNavigationController.displayFruitDetailView(fruitTypeSelected)
    }
    
}
