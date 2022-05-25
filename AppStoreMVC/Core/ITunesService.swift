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
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidUrl("❌ \(urlString) is invalid")
        }
        
        let responseData = try await NetworkManager.shared.fetch(withUrl: url)
        let jsonDecoder = JSONDecoder()
        let searchResponse = try jsonDecoder.decode(SearchResult.self, from: responseData)
        return searchResponse
    }
}
