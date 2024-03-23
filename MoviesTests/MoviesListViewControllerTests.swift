//
//  MoviesListViewControllerTests.swift
//  MoviesTests
//
//  Created by Naval Hasan on 24/03/24.
//

import XCTest
@testable import Movies

class MoviesListViewControllerTests: XCTestCase {
    
    var sut: MoviesListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MoviesListViewController") as? MoviesListViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testViewController_WhenCreated_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testViewController_WhenViewIsLoaded_ShouldSetTableViewDataSource() {
        XCTAssertTrue(sut.movieListTableView.dataSource is MoviesListViewController)
    }
    
    func testViewController_WhenViewIsLoaded_ShouldSetTableViewDelegate() {
        XCTAssertTrue(sut.movieListTableView.delegate is MoviesListViewController)
    }
    
    func testViewController_WhenInitialSetupIsCalled_ShouldCallSearchMovies() {
        let mockNetworkService = MockNetworkService()
        sut.networkService = mockNetworkService
        sut.initialSetup()
        XCTAssertTrue(mockNetworkService.fetchApiDataCalled)
    }
    
    // Add more test cases as needed
    
    // Mock NetworkService class for testing purposes
    class MockNetworkService: NetworkService {
        var fetchApiDataCalled = false
        
        override func fetchApiData<T: Decodable>(endPoint: API, resultType: T.Type, completionHandler: @escaping (T) -> Void) {
            fetchApiDataCalled = true
        }
    }
}
