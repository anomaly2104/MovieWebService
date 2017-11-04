//
//  MoviesListModuleBuilderTests.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/5/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MoviesListBuilder.h"
#import "MoviesListViewController.h"
#import "MoviesListPresenter.h"
#import "MoviesListInteractor.h"
#import "MoviesListRouter.h"
#import "MovieWebService-Swift.h"
#import "DataStore.h"

@interface MoviesListModuleBuilderTests : XCTestCase

@end

@implementation MoviesListModuleBuilderTests

- (void)testBuildingViewController {
    MoviesListBuilder *builder = [MoviesListBuilder new];
    UIViewController *viewController = [builder build];
    
    XCTAssertNotNil(viewController);
    XCTAssertTrue([viewController isKindOfClass:[viewController class]]);
    MoviesListViewController *moviesListViewController = (MoviesListViewController *)viewController;
    
    XCTAssertNotNil(moviesListViewController.output);
    XCTAssertTrue([moviesListViewController.output isKindOfClass:[MoviesListPresenter class]]);
    MoviesListPresenter *presenter = (MoviesListPresenter *)moviesListViewController.output;
    XCTAssertEqual(moviesListViewController, presenter.view);
    
    XCTAssertNotNil(presenter.router);
    XCTAssertTrue([presenter.router isKindOfClass:[MoviesListRouter class]]);
    MoviesListRouter *router = (MoviesListRouter *)presenter.router;
    XCTAssertEqual(moviesListViewController, router.viewController);
    XCTAssertNotNil(router.detailBuilder);
    XCTAssertTrue([router.detailBuilder isKindOfClass:[DetailsModuleBuilder class]]);
    
    XCTAssertNotNil(presenter.interactor);
    XCTAssertTrue([presenter.interactor isKindOfClass:[MoviesListInteractor class]]);
    MoviesListInteractor *interactor = (MoviesListInteractor *)presenter.interactor;
    
    XCTAssertEqual(presenter, interactor.output);
    XCTAssertNotNil(interactor.dataStore);
    XCTAssertTrue([interactor.dataStore isKindOfClass:[DataStore class]]);
    
}

@end
