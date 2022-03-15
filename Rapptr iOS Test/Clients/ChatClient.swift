//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Alamofire
import Combine
import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    var session: URLSession?
    let urlString = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    func fetchChats() -> AnyPublisher<DataResponse<Messages, Error>, Never> {
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")!
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: Messages.self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
