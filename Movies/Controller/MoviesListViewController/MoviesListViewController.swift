//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import UIKit

class MoviesListViewController: UIViewController {
    // #MARK: Outlets
    @IBOutlet weak var movieListTableView: UITableView!
    
    // #MARK: Declarations
    private var networkService = NetworkService()
    var movieResponseModel: MovieResponseModel?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchMovies(for: "matrix")
    }
    
    // #MARK: Other functions
    func searchMovies(for term: String) {
        guard !term.isEmpty else {
            return
        }
        
        networkService.fetchApiData(endPoint: .searchMovies(title: term), resultType: MovieResponseModel.self, completionHandler: { response in
            print(response)
            self.movieResponseModel = response
            DispatchQueue.main.async {
                self.movieListTableView.reloadData()
            }
        })
    }
}
