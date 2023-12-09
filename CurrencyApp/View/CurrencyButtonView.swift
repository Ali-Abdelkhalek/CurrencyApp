//
//  CurrencyButtonView.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation

import SwiftUI

struct currencySelectionView: View {
    @State private var selectedOption = "From"
    
    var body: some View {
        Picker("From", selection: $selectedOption) {
            ForEach(Currency.allCases, id: \.self) { index in
                Text(index.rawValue)
            }
        }
        .pickerStyle(MenuPickerStyle()) // Customize the picker style
        .padding()
    }
}

struct DropdownMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        currencySelectionView()
    }
}
