//
//  FruitDetailViewDelegateProtocol.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol FruitDetailViewDelegateProtocol: class {
    var fruitDetailPresenter: FruitDetailPresenterProtocol? { get set }
    var fruitTypeFromSegue: String {get set}
    func setFruitDetail(fruitSelected: FruitItem?)    
}
