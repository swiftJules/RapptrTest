//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Alamofire
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
    let startDate = Date()
    
    func login(email: String, password: String, completion: @escaping (_ time: TimeInterval?, _ error: RequestError?) -> ()) -> Void {
        let requestParams = RequestParameters(email: email, password: password)
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php")!
        
        AF.request(url, method: .post, parameters: ["email" : "\(requestParams.email)", "password": "\(requestParams.password)"])
            .validate()
            .response  { response in
                switch response.result {
                case .success:
                    let requestExecutionTime = Date().timeIntervalSince(self.startDate)
                    completion(requestExecutionTime, nil)
                case .failure(let error):
                    let executionTimeWithFailure = Date().timeIntervalSince(self.startDate)
                    let requestError = RequestError(error: error.localizedDescription, time: executionTimeWithFailure)
                    completion(executionTimeWithFailure, requestError)
                }
            }
    }
}
