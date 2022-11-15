//
//  DoubleExtensions.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 14/11/22.
//

import Foundation

public extension Double {
    var asCurrencyPtBR: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
