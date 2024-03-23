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
    @IBOutlet weak var searchBar: UISearchBar!
    
    // #MARK: Declarations
    var networkService = NetworkService()
    var movieResponseModel: MovieResponseModel?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // #MARK: Other functions
    
    func initialSetup() {
        // since OMDB does not have a listing public api, adding matrix as default value
        searchMovies(for: "matrix")
        searchBar.delegate = self
        searchBar.placeholder = "Search for movies..."
    }
    
    func searchMovies(for term: String) {
        guard !term.isEmpty else {
            return
        }
        
        networkService.fetchApiData(endPoint: .searchMovies(title: term), resultType: MovieResponseModel.self, completionHandler: { response in
            print(response)
            self.movieResponseModel = response
            DispatchQueue.main.async {
                if response.movieInfo == nil {
                    self.movieListTableView.isHidden = true
                } else {
                    self.movieListTableView.isHidden = false
                }
                self.movieListTableView.reloadData()
            }
        })
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let input = searchText.count == 0 ? "matrix" : searchText
        searchMovies(for: input)
    }
}
