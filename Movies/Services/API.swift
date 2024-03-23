//
//  API.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add other HTTP methods as needed
}

typealias Parameters = [String: Any]

enum API {
    case searchMovies(title: String)
    case getMovieDetail(imdbId: String)
    
    var url: URL {
        switch self {
        case .searchMovies(let title):
            return URL(string: "\(URLConstants.baseURL)?s=\(title)&apikey=\(URLConstants.omdbAPIKey)")!
        case .getMovieDetail(let imdbId):
            return URL(string: "\(URLConstants.baseURL)?i=\(imdbId)&plot=full&apikey=\(URLConstants.omdbAPIKey)")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchMovies:
            return .get
        case .getMovieDetail:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .searchMovies, .getMovieDetail:
            return nil
        }
    }
    
}
