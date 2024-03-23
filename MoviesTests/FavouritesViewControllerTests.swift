//
//  FavouritesViewControllerTests.swift
//  MoviesTests
//
//  Created by Naval Hasan on 24/03/24.
//

import XCTest
@testable import Movies

class FavouritesViewControllerTests: XCTestCase {
    
    var viewController: FavouritesViewController!
    var mockCoreData: MockHandleCoreData!
    
    override func setUpWithError() throws {
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as? FavouritesViewController
        mockCoreData = MockHandleCoreData()
        
        viewController.coreData = mockCoreData
        
        // Load the view
        _ = viewController.view
    }
    
    func testViewWillAppear() {
        // Mock that there are no movies in CoreData
        mockCoreData.fetchMoviesReturnValue = []
        viewController.viewWillAppear(false)
        XCTAssertTrue(viewController.movieListTableView.isHidden)
    }
    
    // Add more tests for other functions as needed
    
    override func tearDownWithError() throws {
        viewController = nil
        mockCoreData = nil
    }
}
