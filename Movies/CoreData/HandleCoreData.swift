//
//  HandleCoreData.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
import CoreData
import UIKit

class HandleCoreData {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func addMovie(id: String, title: String) {
        guard !isMoviePresent(with: id) else {
            print("Movie with id \(id) already exists")
            return
        }

        if let context = appDelegate?.persistentContainer.viewContext {
            let movie = Movie(context: context)
            movie.id = id
            movie.title = title
            appDelegate?.saveContext()
        }
    }
    
    func fetchMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            if let context = appDelegate?.persistentContainer.viewContext {
                let movies = try context.fetch(fetchRequest)
                return movies
            }
            
        } catch {
            print("Error fetching movies: \(error)")
            return []
        }
        return []
    }
    
    func isMoviePresent(with id: String) -> Bool {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            if let context = appDelegate?.persistentContainer.viewContext {
                let movies = try context.fetch(fetchRequest)
                return !movies.isEmpty
            }
        } catch {
            print("Error fetching movies: \(error)")
        }
        return false
    }
    
    func removeMovie(id: String) {
        if let context = appDelegate?.persistentContainer.viewContext {
            let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)
            do {
                if let movie = try context.fetch(fetchRequest).first {
                    context.delete(movie)
                    appDelegate?.saveContext()
                }
            } catch {
                print("Error removing movie: \(error)")
            }
        }
    }
}
