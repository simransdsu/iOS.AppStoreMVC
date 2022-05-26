//
//  App.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import Foundation

struct App: Decodable {
    
    let screenshotUrls: [String]
    let artworkUrl512: String
    let artworkUrl60: String
    let artworkUrl100: String
    let artistViewUrl: String
    let supportedDevices: [String]
    let advisories: [String]
    let minimumOsVersion: String
    let trackCensoredName: String
    let fileSizeBytes: String
    let sellerUrl: String?
    let formattedPrice: String
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let averageUserRating: Double
    let currency: String
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    let currentVersionReleaseDate: String
    let releaseNotes: String
    let primaryGenreId: Int
    let description: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double
    let version: String
}
