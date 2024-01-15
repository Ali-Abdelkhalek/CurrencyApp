//
//  CurrencyButtonView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation

import SwiftUI

struct CurrencyPickerView: View {
    @Binding var selectedCurrency: Currency
    
    var body: some View {
        Picker("From", selection: $selectedCurrency) {
            ForEach(Currency.allCases, id: \.self) { index in
                Text(index.rawValue).tag(index)
            }
        }
        .pickerStyle(MenuPickerStyle()) // Customize the picker style
        .padding()
    }
}

struct DropdownMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedCurrency: Currency = Currency.AED
        CurrencyPickerView(selectedCurrency: $selectedCurrency)
    }
}
