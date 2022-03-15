//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

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
    
    var session: URLSession?
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
     let urlString = "http://dev.rapptrlabs.com/Tests/scripts/login.php"
        
        var components = URLComponents()
        let emailItem = URLQueryItem(name: "email", value: email)
        let passwordItem = URLQueryItem(name: "password", value: password)
        components.queryItems = [emailItem, passwordItem]
        
        guard let url = URL(string: urlString) else { return }
        session?.dataTask(with: url) { data, response, error in
            
        }.resume()
    }
}
