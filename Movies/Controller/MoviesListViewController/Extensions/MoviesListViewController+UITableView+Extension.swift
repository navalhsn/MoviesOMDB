//
//  MoviesListViewController+UITableView+Extension.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
import UIKit

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResponseModel?.movieInfo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.shared.listMoviesTableViewCell) as! ListMoviesTableViewCell
        if let result = movieResponseModel?.movieInfo?[indexPath.row] {
            cell.movieTitleLabel.text = result.title
            cell.movieReleaseDateLabel.text = result.year
           // cell.ratingLabel.text = "\(result.rating ?? 0)/10 "
            if let imageUrl = URL(string: result.poster ?? "")  {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            cell.movieImageView.image = image
                        }
                    }
                } 
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.shared.movieDetailViewController) as? MovieDetailViewController {
//            vc.resultModel = trendingMoviesModel?.results?[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
