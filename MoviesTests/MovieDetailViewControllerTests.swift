//
//  MovieDetailViewControllerTests.swift
//  MoviesTests
//
//  Created by Naval Hasan on 24/03/24.
//

import XCTest
@testable import Movies

class MovieDetailViewControllerTests: XCTestCase {
    
    var viewController: MovieDetailViewController!
    var mockNetworkService: MockNetworkService!
    var mockCoreData: MockHandleCoreData!
    
    override func setUpWithError() throws {
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        mockNetworkService = MockNetworkService()
        mockCoreData = MockHandleCoreData()
        
        viewController.networkService = mockNetworkService
        viewController.coreData = mockCoreData
        
        // Load the view
        _ = viewController.view
    }
    
    func testInitialSetup() {
        // Ensure initial setup calls getMovieDetail and setFavouriteButtonTitle
        XCTAssertTrue(mockNetworkService.fetchApiDataCalled)
        XCTAssertTrue(mockCoreData.isMoviePresentCalled)
    }
    
    func testSetFavouriteButtonTitle() {
        // Mock that movie is present in CoreData
        mockCoreData.isMoviePresentReturnValue = true
        viewController.setFavouriteButtonTitle()
        XCTAssertEqual(viewController.addFavouriteButton.titleLabel?.text, Constants.shared.add_favourite)
    }
    
    // Add more tests for other functions as needed
    
    override func tearDownWithError() throws {
        viewController = nil
        mockNetworkService = nil
        mockCoreData = nil
    }
}

// Mock NetworkService class for testing purposes
class MockNetworkService: NetworkService {
    var fetchApiDataCalled = false
    
    override func fetchApiData<T: Decodable>(endPoint: API, resultType: T.Type, completionHandler: @escaping (T) -> Void) {
        fetchApiDataCalled = true
    }
}

// Mock HandleCoreData class for testing purposes
class MockHandleCoreData: HandleCoreData {
    var isMoviePresentCalled = false
    var isMoviePresentReturnValue = false
    
    override func isMoviePresent(with id: String) -> Bool {
        isMoviePresentCalled = true
        return isMoviePresentReturnValue
    }
    
    
    var fetchMoviesCalled = false
    var fetchMoviesReturnValue: [Movie] = []
    
    override func fetchMovies() -> [Movie] {
        fetchMoviesCalled = true
        return fetchMoviesReturnValue
    }
}
