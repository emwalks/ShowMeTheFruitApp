//
//  FruitDetailPresenter.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class FruitDetailPresenter: FruitDetailPresenterProtocol {
    
    private weak var fruitDetailViewDelegate: FruitDetailViewDelegateProtocol?
    private let fruitDataService: FruitDataServiceProtocol
    var fruitReceivedFromNavigator: String = ""
    
    required init(fruitDetailViewDelegate: FruitDetailViewDelegateProtocol?, fruitDataService: FruitDataServiceProtocol) {
        self.fruitDataService = fruitDataService
        self.fruitDetailViewDelegate = fruitDetailViewDelegate
        showFruitDetail(type: fruitDetailViewDelegate!.fruitTypeFromSegue)
    }
    
    func showFruitDetail(type: String) {
        fruitDataService.getFruitDetail(type: type){ [weak self] fruits in
            
            //something is wrong here! set Fruit detail never gets called in real life
           
            if let fruit = fruits {
                self?.fruitDetailViewDelegate?.setFruitDetail(fruitSelected: fruit)
            }
        }
    }
}

