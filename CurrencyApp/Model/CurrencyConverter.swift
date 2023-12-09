//
//  CurrencyConvertionManager.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation

class CurrencyConverter {
    
    var baseCurrency: Currency
    var targetCurrency: Currency
    
    init(baseCurrency: Currency, targetCurrency: Currency) {
        self.baseCurrency = baseCurrency
        self.targetCurrency = targetCurrency
    }
    
    func calculateExchangeRate(of amount: Double, _ completionHandler: @escaping (Result<Double, Error>)->Void){
        FixerInterface().fetchLatestExchangeRates{ results in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let exchangeRates):
                completionHandler(.success(self.calculateTargetExchangeRate(from: exchangeRates)))
            }
            
        }
    }
    
    private func calculateTargetExchangeRate(from exchangeRates: [String: Double]) -> Double {
        guard let baseRate = exchangeRates[baseCurrency.rawValue] else {return 0}
        guard let targetRate = exchangeRates[targetCurrency.rawValue] else {return 0}
        guard let EUORate = exchangeRates[Currency.EUR.rawValue] else {return 0}
        return baseRate / EUORate * targetRate
    }
    
    func update(baseCurrency: Currency) {
        self.baseCurrency = baseCurrency
    }
    
    
    func update(targetCurrency: Currency) {
        self.targetCurrency = targetCurrency
    }
    
}
