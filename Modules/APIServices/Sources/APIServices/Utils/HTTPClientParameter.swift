//
//  File.swift
//  
//
//  Created by Emerson Carpes on 15/11/22.
//

import Foundation

protocol HTTPClientParameter: Encodable {

}

extension HTTPClientParameter {

    func asUnsafeDictionary() -> [String: Any] {
        var value: [String: Any]!

        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(
                with: data, options: .allowFragments)
            value = (dictionary as? [String: Any]) ?? [:]

        } catch {
            value = [:]
        }

        return value
    }
}
