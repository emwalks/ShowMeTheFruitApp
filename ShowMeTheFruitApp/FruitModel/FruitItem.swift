//
//  FruitItem.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

struct FruitData : Decodable {
    var fruit : [FruitItem]
}

struct FruitItem : Decodable {
    var type : String
    var price : Int
    var weight : Int
    var priceInPounds: Double {
        get { return Double(price) / 100.0 }
    }
    var weightInKilos: Double {
        get { return Double(weight) / 1000.0 }
    }
}
