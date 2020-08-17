//
//  NetworkManager.swift
//  studnetwork
//
//  Created by Георгий Куликов on 17.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit

class NetworkManager: NetworkDelegate {
    func send(token: String) -> String? {
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "access_token", value: token)]
        guard let url = getUrl(path: "/api/login", queryItems: queryItems) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        var userToken: String? = nil
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    guard let dict = json as? NSDictionary else { return }
                    guard let usrToken = dict["token"] as? String else { return }
                    
                    userToken = usrToken
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
        
        return userToken
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
