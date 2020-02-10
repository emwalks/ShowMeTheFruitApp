//
//  FruitDataServiceProtocol.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol FruitDataServiceProtocol {
    
    func getFruits(callback: @escaping(Array<FruitItem?>) -> Void)
    func getFruitDetail(type: String, callback: @escaping(FruitItem?) -> Void)
    
}
