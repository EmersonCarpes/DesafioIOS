//
//  MobileV1Service.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

final class MobileV1Service: HTTPClientService {
    var rootURLPath: String = "https://gateway.marvel.com:443/v1/"
    
    private let ts  = "\(Date().timeIntervalSince1970)"
    
    lazy var parameters: [String : String] = ["limit":"50",
                                              "apikey":Constants.publicKey,
                                              "hash":(ts + Constants.privateKey + Constants.publicKey).md5(),
                                              "ts":ts]
    
    static var shared = MobileV1Service()
}
