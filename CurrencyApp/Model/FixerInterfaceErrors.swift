//
//  FixerInterfaceErrors.swift
//  CurrencyApp
//
//  Created by Ali Abdelkhalek on 09/12/2023.
//

import Foundation


enum FixerInterfaceError: Error, LocalizedError {
    
    case InvalidURL
    case RequestReturnedStatusCodeOtherThan2xx
    case NoDataWasReturnedByTheRequest
    
    //TODO: Add descriptive error messages for each erro
    
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
