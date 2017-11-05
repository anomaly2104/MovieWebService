//
//  DetailsPresenterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//


import XCTest

@testable
import MovieWebService

class DetailsPresenterTests: XCTestCase {

    var presenter: DetailsPresenter!
    var router: MockRouter!
    var interactor: MockInteractor!
    var view: MockView!
	
    override func setUp() {
        super.setUp()
		
        router = MockRouter()
        interactor = MockInteractor()
        view = MockView()

        presenter = DetailsPresenter()
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        presenter = nil

        super.tearDown()
    }
    
    func testItAsksInteractorToFindMovieOnReceivingUpdateView() {
        presenter.updateView()
        XCTAssertTrue(interactor.isFindMovieCalled)
    }
    
    func testItHidesActorContentAfterLoading() {
        presenter.didFinishLoading()
        XCTAssertTrue(view.hideActorContentCalled)
        XCTAssertFalse(view.showActorContentCalled)
    }

    func testItShowsCorrectTextForShowMoreOrLessLabelLabelAfterLoading() {
        presenter.didFinishLoading()
        XCTAssertTrue(view.displayShowMoreTextCalled)
        XCTAssertFalse(view.displayShowLessTextCalled)
    }
    
    func testItCreatesCorrectDisplayItemOnReceivingMovieFromInteractor() {
        let movie = Movie(data: ["name": "movieName",
                                 "director": ["name": "directorName"],
                                 "casts": [["name": "actorName",
                                            "screenName": "actorScreenName"]]])
        presenter.foundMovie(movie: movie)
        XCTAssertTrue(view.showDetailsForDetailDisplayItemCalled)
        let displayItem = view.showDetailsForDetailDisplayItemParam!
        XCTAssertEqual("directorName", displayItem.directorName)
        XCTAssertEqual("actorName", displayItem.actorName)
        XCTAssertEqual("actorScreenName", displayItem.actorScreenName)
    }
    
    func testItCreatesCorrectDisplayItemOnReceivingNilMovieFromInteractor() {
        presenter.foundMovie(movie: nil)
        XCTAssertTrue(view.showDetailsForDetailDisplayItemCalled)
        let displayItem = view.showDetailsForDetailDisplayItemParam!
        XCTAssertNil(displayItem.directorName)
        XCTAssertNil(displayItem.actorName)
        XCTAssertNil(displayItem.actorScreenName)
    }
    
    func testItCreatesCorrectDisplayItemOnReceivingMovieWithoutActorFromInteractor() {
        let movie = Movie(data: ["name": "movieName",
                                 "director": ["name": "directorName"],
                                 "casts": []])
        
        presenter.foundMovie(movie: movie)
        XCTAssertTrue(view.showDetailsForDetailDisplayItemCalled)
        let displayItem = view.showDetailsForDetailDisplayItemParam!
        XCTAssertEqual("directorName", displayItem.directorName)
        XCTAssertNil(displayItem.actorName)
        XCTAssertNil(displayItem.actorScreenName)
    }
    
    func testTapOnShowMoreOrLessWorksCorrectly() {
        //First tap: It shows the actor content and changes text to show less
        presenter.didTapShowMoreOrLessLabel()
        
        XCTAssertTrue(view.showActorContentCalled)
        XCTAssertTrue(view.displayShowLessTextCalled)
        
        XCTAssertFalse(view.hideActorContentCalled)
        XCTAssertFalse(view.displayShowMoreTextCalled)
        
        //Second tap: It hides the actor content and changes text to show more
        view.reset()
        presenter.didTapShowMoreOrLessLabel()
        
        XCTAssertTrue(view.hideActorContentCalled)
        XCTAssertTrue(view.displayShowMoreTextCalled)
        
        XCTAssertFalse(view.showActorContentCalled)
        XCTAssertFalse(view.displayShowLessTextCalled)
    }

    // MARK: - Mock

    class MockInteractor: DetailsInteractorInput {
        var isFindMovieCalled: Bool = false
        
        func findMovie() {
            isFindMovieCalled = true
        }
    }

    class MockRouter: DetailsRouterInput {

    }

    class MockView: DetailsViewInput {
        var showDetailsForDetailDisplayItemCalled = false
        var showDetailsForDetailDisplayItemParam: DetailDisplayItem? = nil
        
        var displayShowMoreTextCalled = false
        var displayShowLessTextCalled = false
        
        var showActorContentCalled = false
        var hideActorContentCalled = false
        
        func showDetailsForDetailDisplayItem(detailDisplayItem: DetailDisplayItem) {
            showDetailsForDetailDisplayItemCalled = true
            showDetailsForDetailDisplayItemParam = detailDisplayItem
        }
        
        func displayShowLessText() {
            displayShowLessTextCalled = true
        }
        
        func displayShowMoreText() {
            displayShowMoreTextCalled = true
        }
        
        func showActorContent() {
            showActorContentCalled = true
        }
        
        func hideActorContent() {
            hideActorContentCalled = true
        }
        
        func reset() {
            showDetailsForDetailDisplayItemCalled = false;
            showDetailsForDetailDisplayItemParam = nil;
            
            displayShowMoreTextCalled = false
            displayShowLessTextCalled = false
            
            showActorContentCalled = false
            hideActorContentCalled = false
        }
    }

}
