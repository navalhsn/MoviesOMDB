//
//  FavouritesViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import UIKit
import CoreData

class FavouritesViewController: UIViewController {
    let coreData = HandleCoreData()
    let movieData = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(coreData.fetchMovies())
    }

}
