//
//  AppsGroup.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import Foundation

struct AppsGroupModel: Decodable {
    let title: String
    let apps: [AppModel]
}
