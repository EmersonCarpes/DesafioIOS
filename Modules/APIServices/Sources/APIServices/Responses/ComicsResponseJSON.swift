//
//  ComicsResponseJSON.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

public struct ComicsResponse: Decodable {
    public let data: ComicsResponseData
}

public struct ComicsResponseData: Decodable {
    public let results: [Movie]
}

public struct Movie: Decodable {
    public let title: String
    public let thumbnail: Thumbnail
    public let issueNumber: Int
    public let prices: [MoviePrice]
}

public struct MoviePrice: Decodable {
    public let type: String
    public let price: Double
}

public struct Thumbnail: Decodable {
    public let path: String
    public let format: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case format = "extension"
    }
}
