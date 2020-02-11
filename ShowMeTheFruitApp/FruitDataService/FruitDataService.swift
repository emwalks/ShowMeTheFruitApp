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

class FruitDataService: FruitDataServiceProtocol   {
    
    static let shared = FruitDataService()
    public let urlConfiguration = URLSessionConfiguration.default
    public var urlSession: URLSession?
    
    let fruitDataURL = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    var listOfFruits: [FruitItem]?
    var foundFruitItem: FruitItem?
    //timeInterval is in units of seconds
    var timeInterval: TimeInterval?
    
    init() {}
    
    func getFruits(callback: @escaping(Array<FruitItem?>, TimeInterval?) -> Void){
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result, requestTimeInterval) in
            switch result {
            case .failure(_):
                self?.listOfFruits = []
                self?.timeInterval = requestTimeInterval
            case .success(let fruits):
                self?.listOfFruits = fruits
                self?.timeInterval = requestTimeInterval
            }
            callback((self?.listOfFruits!)!, self?.timeInterval)
        }
    }
    
    func getFruitDetail(type: String, callback: @escaping(FruitItem?, TimeInterval?) -> Void) {
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result, requestTimeInterval)  in
            switch result {
            case .failure(_):
                self?.foundFruitItem = nil
                self?.timeInterval = requestTimeInterval
            case .success(let fruits):
                self?.foundFruitItem = fruits.first(where: {$0.type == type})
                self?.timeInterval = requestTimeInterval
            }
            callback(self?.foundFruitItem, self?.timeInterval)
        }
    }
        
    func fetchFruitsFromURL(callback: @escaping(Result<[FruitItem], FruitDataServiceError>, TimeInterval?) -> Void) {

        let fetchRequestStartTime = Date()
        
        guard let url = URL(string: fruitDataURL) else { fatalError("URL invalid") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else {
                callback(.failure(.noFruitDataAvailable), Date().timeIntervalSince(fetchRequestStartTime))
                return
            }
           
            do {
                
                let decoder = JSONDecoder()
                let fruitsResponse = try decoder.decode(FruitData.self, from: jsonData)
                let fruits = fruitsResponse.fruit
                callback(.success(fruits), Date().timeIntervalSince(fetchRequestStartTime))
            } catch {
                
                callback(.failure(.fruitDataFailedProcessing), Date().timeIntervalSince(fetchRequestStartTime))
            }
        }
        dataTask.resume()
    }
    
}

extension FruitDataService {
    // stats & event handling
    //NB change time from s to ms
    
}

