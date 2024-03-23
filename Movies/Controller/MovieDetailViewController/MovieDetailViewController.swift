//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    // #MARK: Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var addFavouriteButton: UIButton!
    
    // #MARK: Declarations
    var networkService = NetworkService()
    var imdbId = String()
    var coreData = HandleCoreData()
    var movieDetailModel: MovieDetailModel?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // #MARK: Other functions
    
    func initialSetup() {
        getMovieDetail(for: imdbId)
        setFavouriteButtonTitle()
    }
    
    func setFavouriteButtonTitle() {
        if coreData.isMoviePresent(with: imdbId) {
            addFavouriteButton.setTitle(Constants.shared.remove_favourite, for: .normal)
        } else {
            addFavouriteButton.setTitle(Constants.shared.add_favourite, for: .normal)
        }
    }
    
    func getMovieDetail(for id: String) {
        networkService.fetchApiData(endPoint: .getMovieDetail(imdbId: id), resultType: MovieDetailModel.self, completionHandler: { response in
            self.movieDetailModel = response
            self.setupUI(response: response)
        })
    }
    
    func setupUI(response: MovieDetailModel) {
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
            let rating = response.ratings?[0].value ?? ""
            self.ratingLabel.text = rating
            self.movieDescriptionLabel.text = response.plot
        }
    }
    
    @IBAction func addFavouriteAction() {
        if addFavouriteButton.titleLabel?.text == Constants.shared.add_favourite {
            self.coreData.addMovie(id: movieDetailModel?.imdbID ?? "", title: movieDetailModel?.title ?? "")
        } else {
            coreData.removeMovie(id: movieDetailModel?.imdbID ?? "")
        }
        setFavouriteButtonTitle()
    }
}
