//
//  RequestResponse.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/16/22.
//

import Foundation

struct RequestResponseTime: Decodable {
    let time: TimeInterval
}

struct RequestError: Error {
    let error: String
    let time: TimeInterval
}
