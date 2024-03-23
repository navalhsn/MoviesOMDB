//
//  Common.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
import UIKit

struct Constants {
    static let shared = Constants()
    private init() {}
    // Detail
    let rating = "Rating:"
    let based_on = "Based on"
    let votes = "Votes"
}

struct ColorValues {
    // General
    static let activityIndicatorColor = "#ffe300"
    static let navigationBarBackgroundColor = UIColor.systemBackground
}

struct ViewControllerIdentifiers {
    static let shared = ViewControllerIdentifiers()
    private init() {}
    // Detail
    let movieDetailViewController = "MovieDetailViewController"
}

struct CellIdentifiers {
    static let shared = CellIdentifiers()
    private init() {}
    // Listing
    let listMoviesTableViewCell = "ListMoviesTableViewCell"
}
