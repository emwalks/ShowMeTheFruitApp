//
//  FruitDataService.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

enum FruitDataServiceError : Error {
    case noFruitDataAvailable
    case fruitDataFailedProcessing
}

class FruitDataService:FruitDataServiceProtocol  {
    
    var foundFruitItem: FruitItem? = nil
    
    func getFruitDetail(type: String, callback: @escaping(FruitItem?) -> Void) {
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.foundFruitItem = nil
            case .success(let fruits):
                self?.foundFruitItem = fruits.first(where: {$0.type == type})
                print(self?.foundFruitItem)
            }
            callback(self?.foundFruitItem)
        }
    }
    
    var listOfFruits: [FruitItem]?

    func getFruits(callback: @escaping(Array<FruitItem?>) -> Void){
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.listOfFruits = []
            case .success(let fruits):
                self?.listOfFruits = fruits
            }
            callback((self?.listOfFruits!)!)
        }
    }
    
    
    init() {}
    static let shared = FruitDataService()
    
    let fruitDataURL = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    
    func fetchFruitsFromURL(callback: @escaping(Result<[FruitItem], FruitDataServiceError>) -> Void) {
        
        guard let url = URL(string: fruitDataURL) else { fatalError("URL invalid") }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else {
                callback(.failure(.noFruitDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fruitsResponse = try decoder.decode(FruitData.self, from: jsonData)
                let fruits = fruitsResponse.fruit
                callback(.success(fruits))
            } catch {
                callback(.failure(.fruitDataFailedProcessing))
            }
        }
        dataTask.resume()
    }
    
}
