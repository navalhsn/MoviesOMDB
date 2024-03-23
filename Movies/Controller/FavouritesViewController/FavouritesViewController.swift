//
//  FavouritesViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import UIKit
import CoreData

class FavouritesViewController: UIViewController {
    // #MARK: Outlets
    @IBOutlet weak var movieListTableView: UITableView!
    
    // #MARK: Declarations
    let coreData = HandleCoreData()
    var movieData: [Movie]?
    
    // #MARK: VCLC
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        movieData = coreData.fetchMovies()
        if movieData?.count == 0 {
            movieListTableView.isHidden = true
        } else {
            movieListTableView.isHidden = false
        }
        movieListTableView.reloadData()
    }
}
