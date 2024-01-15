//
//  CurrencySelectionView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 15/01/2024.
//

import SwiftUI

struct CurrencySelectionView: View {
    @Binding var baseCurrency: Currency
    @Binding var targetCurrency: Currency
    var body: some View {
        HStack{
            Text("From")
            CurrencyPickerView(selectedCurrency: $baseCurrency)
            Spacer()
            Button(action: {
                swap(&baseCurrency, &targetCurrency)
            }) {
                Image(systemName: "arrow.left.arrow.right")
            }
            Spacer()
            Text("To")
            CurrencyPickerView(selectedCurrency: $targetCurrency)
        }
    }
}


struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var baseCurrency: Currency = Currency.AED
        @State var targetCurrency: Currency = Currency.AED
        CurrencySelectionView(baseCurrency: $baseCurrency, targetCurrency: $targetCurrency)
    }
}
