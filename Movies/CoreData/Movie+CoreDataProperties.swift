//
//  Movie+CoreDataProperties.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?

}

extension Movie : Identifiable {

}
