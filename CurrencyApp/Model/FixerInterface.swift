//
//  FixerInterface.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation

enum FixerInterfaceError: Error, LocalizedError {
    
    case InvalidURL
    case RequestReturnedStatusCodeOtherThan2xx
    case NoDataWasReturnedByTheRequest
    
    var errorDescription: String? {
        switch self {
        case .InvalidURL:
            return NSLocalizedString("Something wrong happened\n Please check your network and try again.", comment: "")
        case .RequestReturnedStatusCodeOtherThan2xx:
            return NSLocalizedString("Something wrong happened\n Please check your network and try again.", comment: "")
        case .NoDataWasReturnedByTheRequest:
            return NSLocalizedString("Something wrong happened\n Please check your network and try again.", comment: "")
            
        }
    }
}

class FixerInterface {
    
    static let shared = FixerInterface()
    
    func fetchLatestExchangeRates( _ completionHandler: @escaping (Result<[String: Double], Error>)->Void){
        guard let url = createFixerLatestExchangeRatesURL() else {
            completionHandler(.failure(FixerInterfaceError.InvalidURL))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            let statusCode: Int? = (response as? HTTPURLResponse)?.statusCode
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let statusCode = statusCode, statusCode >= 200 && statusCode <= 299 else {
                completionHandler(.failure(FixerInterfaceError.RequestReturnedStatusCodeOtherThan2xx))
                return
            }
            guard let data = data else {
                completionHandler(.failure(FixerInterfaceError.NoDataWasReturnedByTheRequest))
                return
            }
            completionHandler(.success(self.parseFixerLatestExchangeRatesResponse(from: data)))
        }
        
        task.resume()
    }
    
    private func parseFixerLatestExchangeRatesResponse(from data: Data) -> [String: Double] {
        guard let response = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return [:]
        }
        guard let exchangeRates = response["rates"] as? [String: Double] else {
            return [:]
        }
        return exchangeRates
    }
    
    private func createFixerLatestExchangeRatesURL() -> URL? {
        let accessToken = "4a0edc717e7677d20f98b9106c11d2bd"
        
        guard var urlComponents = URLComponents(string: "http://data.fixer.io/api/latest") else {
            return nil
        }
        
        let tokenQueryItem = URLQueryItem(name: "access_key", value: accessToken)
        urlComponents.queryItems = [tokenQueryItem]
        return urlComponents.url
        
    }
}
