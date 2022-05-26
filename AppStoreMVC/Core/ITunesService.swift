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
    
    func searchAPI(withTerm term: String) async throws -> SearchResult {
        let urlString = "https://itunes.apple.com/search?term=\(term)&entity=software".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await call(endpoint: urlString)
    }
    
    func fetchTopApps() async throws -> SearchResult {
        
        let urlString = "https://itunes.apple.com/search?term=top apps&entity=software".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await call(endpoint: urlString)
    }
    
    func fetchTopProductivityApps() async throws -> SearchResult {
        
        let urlString = "https://itunes.apple.com/search?term=productivity&entity=software".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await call(endpoint: urlString)
    }
    
    func fetchTopUtilityApps() async throws -> SearchResult {
        
        let urlString = "https://itunes.apple.com/search?term=utility&entity=software".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return try await call(endpoint: urlString)
    }
    
    
    private func call(endpoint: String) async throws -> SearchResult {
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidUrl("❌ \(endpoint) is invalid")
        }
        
        let responseData = try await NetworkManager.shared.fetch(withUrl: url)
        let jsonDecoder = JSONDecoder()
        let searchResponse = try jsonDecoder.decode(SearchResult.self, from: responseData)
        return searchResponse
    }
}
