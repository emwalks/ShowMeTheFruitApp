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
    
    static private let shared = FruitDataService()
    public let urlConfiguration = URLSessionConfiguration.default
    public var urlSession: URLSession?
    
    private let fruitDataURL = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    private var listOfFruits: [FruitItem]?
    private var foundFruitItem: FruitItem?
    //timeInterval is in units of seconds
    private var timeInterval: TimeInterval?
    
    init() {}
    
    func getFruits(callback: @escaping(Array<FruitItem?>) -> Void){
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.listOfFruits = []
                let errorEventURL = self?.errorEvent(errorDescription: "Unable to get fruit data")
                self?.sendStatistics(event: errorEventURL!)
            case .success(let fruits):
                self?.listOfFruits = fruits
            }
            callback((self?.listOfFruits!)!)
        }
    }
    
    func getFruitDetail(type: String, callback: @escaping(FruitItem?) -> Void) {
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result)  in
            switch result {
            case .failure(_):
                self?.foundFruitItem = nil
                let errorEventURL = self?.errorEvent(errorDescription: "Unable to get fruit details")
                self?.sendStatistics(event: errorEventURL!)
            case .success(let fruits):
                self?.foundFruitItem = fruits.first(where: {$0.type == type})
            }
            callback(self?.foundFruitItem)
        }
    }
    
    private func fetchFruitsFromURL(callback: @escaping(Result<[FruitItem], FruitDataServiceError>) -> Void) {
        
        let fetchRequestStartTime = Date()
        
        //should this be an assertion failure instead of a fatal error - reduce likelihood of app crash?
        //can you use assertion failures with guard?
        
        guard let url = URL(string: fruitDataURL) else {
            let errorEventURL = self.errorEvent(errorDescription: "URL invalid")
            self.sendStatistics(event: errorEventURL)
            fatalError("URL invalid")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let jsonData = data else {
                let loadEventURL = self.loadEvent(timeTaken: Date().timeIntervalSince(fetchRequestStartTime))
                self.sendStatistics(event: loadEventURL)
                callback(.failure(.noFruitDataAvailable))
                let errorEventURL = self.errorEvent(errorDescription: "No fruit data available")
                self.sendStatistics(event: errorEventURL)
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let fruitsResponse = try decoder.decode(FruitData.self, from: jsonData)
                let fruits = fruitsResponse.fruit
                let loadEventURL = self.loadEvent(timeTaken: Date().timeIntervalSince(fetchRequestStartTime))
                self.sendStatistics(event: loadEventURL)
                callback(.success(fruits))
            } catch {
                let loadEventURL = self.loadEvent(timeTaken: Date().timeIntervalSince(fetchRequestStartTime))
                self.sendStatistics(event: loadEventURL)
                callback(.failure(.fruitDataFailedProcessing))
                let errorEventURL = self.errorEvent(errorDescription: "Fruit data processing failed")
                self.sendStatistics(event: errorEventURL)
            }
        }
        dataTask.resume()
    }
    
    enum StatisticsEvents {
        case load
        case display
        case error
        
        var queryItem: URLQueryItem {
            let queryName = "event"
            switch self {
            case .load: return URLQueryItem(name: queryName, value: "load")
            case .display: return URLQueryItem(name: queryName, value: "display")
            case .error: return URLQueryItem(name: queryName, value: "error")
            }
        }
    }
    
    private func createStatsURLComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/fmtvp/recruit-test-data/master/stats"
        return urlComponents
    }
    
    private let queryName = "data"
    
    func loadEvent(timeTaken: TimeInterval) -> URLComponents {
        
        var statsUrlComponents = createStatsURLComponents()
        let queryItem = StatisticsEvents.load.queryItem
        let queryData = URLQueryItem(name: queryName, value: "\(Double(timeTaken*1000))")
        statsUrlComponents.queryItems = [queryItem, queryData]
        return statsUrlComponents
    }
    
    func displayEvent(timeTaken: TimeInterval) -> URLComponents {
        var statsUrlComponents = createStatsURLComponents()
        let queryItem = StatisticsEvents.display.queryItem
        let queryData = URLQueryItem(name: queryName, value: "\(Double(timeTaken*1000))")
        statsUrlComponents.queryItems = [queryItem, queryData]
        return statsUrlComponents
    }
    
    
    func errorEvent(errorDescription: String) -> URLComponents {
        var statsUrlComponents = createStatsURLComponents()
        let queryItem = StatisticsEvents.error.queryItem
        let queryData = URLQueryItem(name: queryName, value: errorDescription)
        statsUrlComponents.queryItems = [queryItem, queryData]
        return statsUrlComponents
    }
    
    func sendStatistics(event: URLComponents) {
        guard let url = event.url else {
            let errorEventURL = self.errorEvent(errorDescription: "URL invalid")
            self.sendStatistics(event: errorEventURL)
            fatalError("URL invalid")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request)
        print("GET request made to the following URL: \(request)")
        dataTask.resume()
    }
    
}

