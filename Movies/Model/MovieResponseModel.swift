//
//  MovieResponseModel.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation

struct MovieResponseModel: Decodable {
    let movieInfo: [MovieInfo]?
    let totalResults: String?
    let response: String?
    let error: String?
    
    private enum CodingKeys: String, CodingKey {
        case movieInfo = "Search"
        case totalResults = "totalResults"
        case response = "Response"
        case error = "Error"
    }
}

struct MovieInfo: Decodable {
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
