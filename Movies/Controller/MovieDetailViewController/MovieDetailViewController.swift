//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
import UIKit

class MovieDetailViewController: BaseViewController {
    // #MARK: Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var addFavouriteButton: UIButton!
    
    // #MARK: Declarations
    private var networkService = NetworkService()
    var imdbId = String()
    let coreData = HandleCoreData()
    var movieDetailModel: MovieDetailModel?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieDetail(for: imdbId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDetailNavigationBar()
    }
    
    // #MARK: Other functions
    func getMovieDetail(for id: String) {
        networkService.fetchApiData(endPoint: .getMovieDetail(imdbId: id), resultType: MovieDetailModel.self, completionHandler: { response in
            print(response)
            self.movieDetailModel = response
            DispatchQueue.main.async {
                self.movieTitleLabel.text = response.title
                self.movieReleaseDateLabel.text = Constants.shared.year + (response.year ?? "")
                if let imageUrl = URL(string: response.poster ?? "")  {
                    DispatchQueue.global().async {
                        if let imageData = try? Data(contentsOf: imageUrl) {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.movieImageView.image = image
                            }
                        }
                    }
                }
                // rating
                let rating = response.ratings?[0].value ?? ""
                self.ratingLabel.text = rating
                self.movieDescriptionLabel.text = response.plot
            }
        })
    }
    
    @IBAction func addFavouriteAction() {
        coreData.addMovie(id: movieDetailModel?.imdbID ?? "", title: movieDetailModel?.title ?? "")
    }
}
