//
//  SearchResult.swift
//  WilliamsAppStore
//
//  Created by Chinwa Williams on 03/03/2019.
//  Copyright © 2019 Chinwa Williams. All rights reserved.
//

import Foundation

struct SearchResult : Decodable {
    let  resultCount : Int
    let  results : [Result]
}
struct Result : Decodable {
    let trackName : String
    let primaryGenreName : String
    let averageUserRating : Float?
    let screenshotUrls : [String]
    let artworkUrl100: String
}
