//
//  DetailsInteractorTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsInteractorTests: XCTestCase {

    var interactor: DetailsInteractor!
    var output: MockOutput!
    var dataStore: MockDataStore!
    let testMovieName = "TestMovie"
	
    override func setUp() {
        super.setUp()
		
        output = MockOutput()
        dataStore = MockDataStore()
        
        interactor = DetailsInteractor(withMovieName: testMovieName, dataStore: DataStore())
        interactor.output = output
        interactor.dataStore = dataStore
    }

    override func tearDown() {
        output = nil
        interactor = nil
        
        super.tearDown()
    }
    
    func testFoundMovieFromDataStoreWillBeGivenInCallbackMethod() {
        interactor.findMovie()
        XCTAssertTrue(output.isFoundMovieCalled)
        XCTAssertEqual(dataStore.testMovie, output.foundMovieCalledParam)
    }
    
    func testFindMovieCallsDataStoreWithCorrectMovieName() {
        interactor.findMovie()
        XCTAssertTrue(dataStore.isGetMovieCalled)
        XCTAssertEqual(testMovieName, dataStore.getMovieCalledParam)
    }

    // MARK: - Mock
    
    class MockDataStore: DataStore {
        let testMovie = Movie()
        var isGetMovieCalled: Bool = false
        var getMovieCalledParam: String? = nil
        
        override func getMovieWithName(_ movieName: String!, callback: ((Movie?) -> Void)!) {
            isGetMovieCalled = true
            getMovieCalledParam = movieName

            callback(testMovie)
        }
    }

    class MockOutput: DetailsInteractorOutput {
        var isFoundMovieCalled: Bool = false
        var foundMovieCalledParam: Movie? = nil
        
        func foundMovie(movie: Movie?) {
            isFoundMovieCalled = true
            foundMovieCalledParam = movie
        }
    }

}
