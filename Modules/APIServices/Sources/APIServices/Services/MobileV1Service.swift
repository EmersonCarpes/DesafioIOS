//
//  MobileV1Service.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

final class MobileV1Service: HTTPClientService {
    
    private let ts  = "\(Date().timeIntervalSince1970)"
    
    override var rootURLPath: String { return "https://gateway.marvel.com:443/v1/" }
    
    override var parameters: [String : Any] { return ["limit":"48",
                                                  "apikey":Constants.publicKey,
                                                  "hash":(ts + Constants.privateKey + Constants.publicKey).md5(),
                                                  "ts":ts] }
    
    static var shared = MobileV1Service()
}
