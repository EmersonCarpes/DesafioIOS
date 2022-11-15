//
//  ComicsResponseJSON.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

public struct ComicsResponseJSON: Decodable {
    public let data: ComicsResponseDataJSON
}

public struct ComicsResponseDataJSON: Decodable {
    public let offset: Int
    public let results: [MovieJSON]
}

public struct MovieJSON: Decodable {
    public let title: String
    public let thumbnail: ThumbnailJSON
    public let issueNumber: Int
    public let prices: [MoviePriceJSON]
}

public struct MoviePriceJSON: Decodable {
    public let type: String
    public let price: Double
}

public struct ThumbnailJSON: Decodable {
    public let path: String
    public let format: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case format = "extension"
    }
}
