//
//  DetailsViewTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsViewControllerTests: XCTestCase {

    var output: MockOutput!
    var viewController: DetailsViewController!
	
    override func setUp() {
        super.setUp()

        output = MockOutput()
		
        viewController = DetailsViewController()
        viewController.output = output
    }

    override func tearDown() {
        output = nil
        viewController = nil
		
        super.tearDown()
    }

    func testFinishLoadingShouldBeCalledAfterLoading() {
        viewController.viewDidLoad()
        XCTAssertTrue(output.didFinishLoadingCalled)
    }
    
    func testOutputShouldBeNotifiedOnReceivingTapOnShowMoreOrLessLabel() {
        viewController.showMoreOrLessTapped(UILabel())
        XCTAssertTrue(output.didTapShowMoreOrLessLabelCalled)
    }
    
    func testUpdateViewShouldBeCalledOnWillAppear() {
        viewController.viewWillAppear(true)
        XCTAssertTrue(output.updateViewCalled)
    }

    // MARK: - Mock

    class MockOutput: DetailsViewOutput {
        var updateViewCalled = false
        var didFinishLoadingCalled = false
        var didTapShowMoreOrLessLabelCalled = false

        func updateView() {
            updateViewCalled = true
        }
        
        func didFinishLoading() {
            didFinishLoadingCalled = true
        }
        
        func didTapShowMoreOrLessLabel() {
            didTapShowMoreOrLessLabelCalled = true
        }
		
    }
}
