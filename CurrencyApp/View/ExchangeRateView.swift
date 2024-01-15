//
//  ExchangeRateView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 15/01/2024.
//

import SwiftUI

struct ExchangeRateView: View {
    @Binding var baseAmount: String
    @Binding var targetAmount: String
    var body: some View {
        HStack(spacing: 0){
            TextField("Enter amount", text: $baseAmount)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text($targetAmount.wrappedValue)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct ExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        @State var baseAmount: String = ""
        @State var targetAmount: String = "0"
        ExchangeRateView(baseAmount: $baseAmount, targetAmount: $targetAmount)
    }
}
