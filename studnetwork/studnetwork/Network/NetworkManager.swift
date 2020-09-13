//
//  NetworkManager.swift
//  studnetwork
//
//  Created by Георгий Куликов on 17.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit

class NetworkManager: NetworkDelegate {
    
    func createUser(accessToken: String, complition: @escaping (_ token: String?) -> ()) {
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "access_token", value: accessToken)]
        guard let url = getUrl(path: "/api/login", queryItems: queryItems) else {
            complition(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    guard let dict = json as? NSDictionary else {
                        complition(nil)
                        return
                    }
                    
                    guard let userToken = dict["token"] as? String else {
                        complition(nil)
                        return
                    }
                    
                    complition(userToken)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getUser(token: String, complition: @escaping (_ user: User?) -> ()) {
        var user: User?
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "token", value: token)]
        guard let url = getUrl(path: "/api/user", queryItems: queryItems) else {
            complition(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                do {
                    user = try JSONDecoder().decode(User.self, from: data)
                    complition(user)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func update(user: User, complition: (() -> ())? = nil) {
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "token", value: user.token)]
        guard let url = getUrl(path: "/api/user", queryItems: queryItems) else { return }
        var data: Data?
        
        do {
            data = try JSONEncoder().encode(user)
        } catch {
            print(error.localizedDescription)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.httpBody = data
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let complition = complition { complition() }
        }.resume()
    }
    
    private func getUrl(path: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "127.0.0.1"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}
