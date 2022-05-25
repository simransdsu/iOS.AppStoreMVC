//
//  NetworkManager.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-09.
//

import Foundation

class NetworkManager {
    
    private init() { }

    static let shared = NetworkManager()
    
    func fetch(withUrl url: URL) async throws -> Data {
        
        let (data, response) =  try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 {
            return data
        }
        
        throw APIError.non200Response(response as? HTTPURLResponse)
    }
}


enum APIError: Error {
    
    case non200Response(HTTPURLResponse?)
    case invalidUrl(String)
}
