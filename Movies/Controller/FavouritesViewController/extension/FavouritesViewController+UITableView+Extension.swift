//
//  FavouritesViewController+UITableView+Extension.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import UIKit
import CoreData

extension FavouritesViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.shared.favouriteTableViewCell) as! FavouriteTableViewCell
        cell.movieTitleLabel.text = movieData[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.shared.movieDetailViewController) as? MovieDetailViewController {
            vc.imdbId = movieData[indexPath.row].id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
