//
//  DetailsModuleBuilderTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsModuleBuilderTests: XCTestCase {
    let testMovieName = "MovieName"

    func testBuildViewController() {

        // given
        let builder = DetailsModuleBuilder()

        // when
        let viewController = builder.build(withMovieName: testMovieName) as! DetailsViewController

        // then
        XCTAssertNotNil(viewController.output)
        XCTAssertTrue(viewController.output is DetailsPresenter)

        let presenter: DetailsPresenter = viewController.output as! DetailsPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.router is DetailsRouter)

        let interactor: DetailsInteractor = presenter.interactor as! DetailsInteractor
        XCTAssertNotNil(interactor.output)
        XCTAssertEqual(testMovieName, interactor.movieName)

        let router: DetailsRouter = presenter.router as! DetailsRouter
        XCTAssertNotNil(router.viewController)
    }

}
