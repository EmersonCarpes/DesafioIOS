//
//  MovieTransformer.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 15/11/22.
//

import Foundation
import APIServices

struct MovieTransformer {

    static func movies(_ entities: [MovieJSON]) -> [Movie] {
        let movies = entities.map { json in
            return Movie(title: json.title,
                         thumbnailURL: "\(json.thumbnail.path).\(json.thumbnail.format)",
                         issueNumber: "# \(json.issueNumber)",
                         price: (json.prices.first?.price ?? 0.0).asCurrencyPtBR)
        }
        return movies
    }
}
