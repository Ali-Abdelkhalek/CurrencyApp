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
                
                HStack{
                    Text("From")
                    currencySelectionView(selectedOption: $baseCurrency)
                    Spacer()
                    
                    Button(action: {
                        let tempCurrency = baseCurrency
                        baseCurrency = targetCurrency
                        targetCurrency = tempCurrency
                        // TODO: update UI and recalculate
                        
                    }) {
                        Image(systemName: "arrow.left.arrow.right")
                    }
                    
                    
                    Spacer()
                    Text("From")
                    currencySelectionView(selectedOption: $targetCurrency)
                }
                HStack{
                    TextField("Enter amount", text: $baseAmount)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: baseAmount) { newValue, _ in
                            //TODO: Guard on non number inputs
                            //TODO: customize the keyboard for numbers only
                            updateExchangeRate(forBaseAmount: newValue)
                        }
                    Text($targetAmount.wrappedValue)
                }
                
                NavigationLink(destination: HistoryView()) {
                    Text("Details")
                }
                
            }
            .padding()
            
        }
    }
    
    func updateExchangeRate(forBaseAmount newBaseAmount: String) {
        //TODO: Guard on optionals
        model.calculateExchangeRate(of: Double(newBaseAmount) ?? 0.0, from: baseCurrency, to: targetCurrency){ result in
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

