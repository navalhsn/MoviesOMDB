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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieData = coreData.fetchMovies()
        movieListTableView.reloadData()
    }
    
}
