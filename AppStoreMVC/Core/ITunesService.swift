//
//  ITunesService.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-09.
//

import Foundation

class ITunesService {
    
    private init() { }
    
    static let shared = ITunesService()
    
    func searchAPI(withTerm term: String) async throws -> SearchResultAPI {
        let urlString = "https://itunes.apple.com/search?term=\(term)&entity=software"
        return try await call(endpoint: urlString)
    }
    
    func fetchTopApps() async throws -> SearchResultAPI {
        
        let urlString = "https://itunes.apple.com/search?term=top apps&entity=software"
        return try await call(endpoint: urlString)
    }
    
    func fetchTopProductivityApps() async throws -> SearchResultAPI {
        
        let urlString = "https://itunes.apple.com/search?term=productivity&entity=software"
        return try await call(endpoint: urlString)
    }
    
    func fetchTopUtilityApps() async throws -> SearchResultAPI {
        
        let urlString = "https://itunes.apple.com/search?term=utility&entity=software"
        return try await call(endpoint: urlString)
    }
    
    func fetchHeaders() async throws -> [Header] {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        return try await call(endpoint: urlString)
    }
    
    
    private func call<T: Decodable>(endpoint: String) async throws -> T {
        
        guard let url = URL(string: endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            throw APIError.invalidUrl("❌ \(endpoint) is invalid")
        }
        
        let responseData = try await NetworkManager.shared.fetch(withUrl: url)
        let jsonDecoder = JSONDecoder()
        let response = try jsonDecoder.decode(T.self, from: responseData)
        return response
    }
}
