//
//  CurrencyExchangeView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import SwiftUI

struct CurrencyExchangeView: View {
    @State private var baseCurrency: String = "AED"
    @State private var TargetCurrency: String = "AED"
    @State private var amount: String = ""
    
    let currencies = ["USD", "EUR", "GBP", "JPY", "CAD"] // Add more currencies as needed
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                HStack{
                    // From Currency Dropdown
                    Text("From")
                    currencySelectionView(selectedOption: $baseCurrency)
                    Spacer()
                    
                    Button(action: {
                        // Perform reverse action
                    }) {
                        Image(systemName: "arrow.left.arrow.right")
                    }
                    Spacer()
                    // From Currency Dropdown
                    Text("From")
                    currencySelectionView()
                }
                HStack{
                    TextField("Enter amount", text: $amount)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("0")
                }
                
                NavigationLink(destination: HistoryView()) {
                    Text("Details")
                }
                
            }
            .padding()
            
        }
    }
}

struct CurrencyExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyExchangeView()
    }
}

