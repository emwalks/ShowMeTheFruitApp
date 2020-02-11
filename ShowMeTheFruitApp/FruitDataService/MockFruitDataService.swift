//
//  MockFruitDataService.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockFruitDataService: FruitDataServiceProtocol {
 
    func getFruits(callback:@escaping(Array<FruitItem?>) -> Void) {
        let arrayOfFruitItems = [
                   FruitItem(type: "mockApple", price: 149, weight: 120),
                   FruitItem(type: "mockBanana", price: 129, weight: 80)
               ]
        callback(arrayOfFruitItems)
    }
    
    func getFruitDetail(type: String, callback:@escaping(FruitItem?) -> Void) {
        let arrayOfFruitItems = [
            FruitItem(type: "mockApple", price: 149, weight: 120),
            FruitItem(type: "mockBanana", price: 129, weight: 80)
        ]
        
        if let foundFruitType = arrayOfFruitItems.first(where: {$0.type == type}) {
            callback(foundFruitType)
        } else {
            callback(nil)
        }
    }
    
    var urlComponents = URLComponents()
    
    func createStatsURLComponents() -> URLComponents {
    
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/fmtvp/recruit-test-data/master/stats"
        return urlComponents
    }
    
    func loadEvent(timeTaken: TimeInterval) -> URLComponents {
         return urlComponents
     }
     
     func displayEvent(timeTaken: TimeInterval) -> URLComponents {
         return urlComponents
     }
    
   func errorEvent(errorDescription: String) -> URLComponents {
          return urlComponents
      }
     
     var statisticsSent = false
     
     func sendStatistics(event: URLComponents) {
         statisticsSent = true
     }
}
