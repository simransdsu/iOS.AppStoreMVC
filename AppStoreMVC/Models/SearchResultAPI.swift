//
//  SearchResult.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-09.
//

import Foundation

struct SearchResultAPI: Decodable {
    let resultCount: Int
    let results: [App]
}
