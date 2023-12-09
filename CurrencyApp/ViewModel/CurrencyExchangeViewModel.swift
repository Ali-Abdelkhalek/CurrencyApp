//
//  CurrencyConvertionManager.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation

class CurrencyExchangeViewModel {
    
    func calculateExchangeRate(of amount: Double, from baseCurrency: Currency, to targetCurrency: Currency,  _ completionHandler: @escaping (Result<Double, Error>)->Void){
        FixerInterface().fetchLatestExchangeRates{ results in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let exchangeRates):
                completionHandler(.success(self.calculateTargetExchangeRate(of: amount, from: baseCurrency, to: targetCurrency, from: exchangeRates)))
            }
            
        }
    }
    
    private func calculateTargetExchangeRate(of amount: Double, from baseCurrency: Currency, to targetCurrency: Currency, from exchangeRates: [String: Double]) -> Double {
        guard let baseRate = exchangeRates[baseCurrency.rawValue] else {return 0}
        guard let targetRate = exchangeRates[targetCurrency.rawValue] else {return 0}
        guard let EUORate = exchangeRates[Currency.EUR.rawValue] else {return 0}
        return amount * baseRate / EUORate * targetRate
    }
    
}
