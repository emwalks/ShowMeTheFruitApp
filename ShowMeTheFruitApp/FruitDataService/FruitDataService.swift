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

class FruitDataService: FruitDataServiceProtocol {
    func getFruitDetail(type: (String), callBack: (FruitItem?) -> Void) {
        
    }
    
    var listOfFruits = [FruitItem]()
    
    func getFruits(callback:(Array<FruitItem?>) -> Void){
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.listOfFruits = []
            case .success(let fruits):
                self?.listOfFruits = fruits
                }
            }
        callback(listOfFruits)
        }
    
    
    init() {}
    static let shared = FruitDataService()
    
    let fruitDataURL = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    
    func fetchFruitsFromURL(completion: @escaping(Result<[FruitItem], FruitDataServiceError>) -> Void) {
        
        guard let url = URL(string: fruitDataURL) else { fatalError("URL invalid") }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else {
                completion(.failure(.noFruitDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fruitsResponse = try decoder.decode(FruitData.self, from: jsonData)
                let fruits = fruitsResponse.fruit
                completion(.success(fruits))
            } catch {
                completion(.failure(.fruitDataFailedProcessing))
            }
        }
        dataTask.resume()
    }
    
}
