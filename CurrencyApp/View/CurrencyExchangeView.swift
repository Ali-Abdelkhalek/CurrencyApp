//
//  CurrencyExchangeView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import SwiftUI

struct CurrencyExchangeView: View {
    @State private var baseCurrency: Currency = Currency.AED
    @State private var targetCurrency: Currency = Currency.AED
    @State private var baseAmount: String = ""
    @State private var targetAmount: String = "0"
    let model = CurrencyExchangeViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                CurrencySelectionView(baseCurrency: $baseCurrency, targetCurrency: $targetCurrency)
                ExchangeRateView(baseAmount: $baseAmount, targetAmount: $targetAmount)
                    .onChange(of: baseAmount, { _, _ in
                        updateExchangeRate()
                    })
                NavigationLink(destination: HistoryView()) {
                    Text("Details")
                }
            }
            .padding()
            .onChange(of: [baseCurrency, targetCurrency]) { _, _ in
                updateExchangeRate()
            }
        }
    }
    
    func updateExchangeRate() {
        //TODO: Guard on optionals
        model.calculateExchangeRate(of: Double(baseAmount) ?? 0.0, from: baseCurrency, to: targetCurrency){ result in
            switch result {
            case .failure(_):
                //TODO: Show error message
                break
            case .success(let targetAmount):
                self.targetAmount = "\(targetAmount)"
            }
            
        }
    }
}

struct CurrencyExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyExchangeView()
    }
}

