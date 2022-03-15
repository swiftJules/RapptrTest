//
//  LoginClient.swift
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
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
        
    func login(email: String, password: String) -> AnyPublisher<DataResponse<User, Error>, Never> {
        
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php?email=info@rapptrlabs.com&password=Test123")!
        return AF.request(url,
                          method: .get)
            .validate()
            .response { response in
                print(response)
            }
            .publishDecodable(type: User.self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
