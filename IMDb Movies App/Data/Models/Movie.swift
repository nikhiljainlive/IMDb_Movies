//
//  Movie.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import Foundation

import Foundation

struct Movie : Codable {
    let posterPath : String
    let title : String
    let originalLanguage : String
    let releasedDate : String
    let overview : String
    let popularity : Double
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case title = "title"
        case originalLanguage = "original_language"
        case releasedDate = "release_date"
        case overview = "overview"
        case popularity = "popularity"
    }
}
