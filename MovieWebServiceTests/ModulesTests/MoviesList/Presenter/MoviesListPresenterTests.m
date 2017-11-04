//
//  MoviesListPresenterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MoviesListDisplayItem.h"
#import "Film.h"
#import <DateTools/DateTools.h>

@interface MoviesListPresenterTests : XCTestCase

@property (nonatomic, strong) MoviesListPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation MoviesListPresenterTests


- (void)setUp {
    [super setUp];

    self.presenter = [[MoviesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(MoviesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(MoviesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(MoviesListViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

- (void)testItAsksInterceptorToFindMoviesListForUpdateViewEventFromView {
    [[self.mockInteractor expect] findMoviesList];
    
    [self.presenter updateView];
    
    [self.mockInteractor verify];
}

- (void)testItAsksRouterToPresentDetailViewForSelectedMovie {
    NSString *testMovieName = @"TestMovie";
    MoviesListDisplayItem *testItem = [MoviesListDisplayItem new];
    testItem.name = testMovieName;
    [[self.mockRouter expect] presentMovieDetailInterfaceForMovieWithName:testMovieName];
    
    [self.presenter selectedMovie:testItem];
    
    [self.mockRouter verify];
}

- (void)testViewIsCalledWithCorrectMovieListDisplayItems {
    [[self.mockView expect] showMoviesList:[OCMArg checkWithBlock:^BOOL(NSArray *movieDisplayList) {
        XCTAssertEqual(movieDisplayList.count, 1);
        XCTAssertTrue([movieDisplayList.firstObject isKindOfClass:[MoviesListDisplayItem class]]);
        
        MoviesListDisplayItem *displayItem = movieDisplayList.firstObject;
        
        XCTAssertEqualObjects(displayItem.name, @"TestMovie");
        XCTAssertEqualObjects(displayItem.releaseDate, @"Oct 12, 2012");
        XCTAssertEqualObjects(displayItem.filmRating, @"R");
        XCTAssertEqualObjects(displayItem.rating, @"7.8");
        return YES;
    }]];
    
    
    NSArray *testMovieList = @[[self filmWithName:@"TestMovie"
                                      releaseDate:[NSDate dateWithYear:2012
                                                                 month:10
                                                                   day:12]
                                       filmRating:@3
                                           rating:@7.8]];
    [self.presenter foundMoviesList:testMovieList];
    
    [self.mockRouter verify];
}

- (Film *)filmWithName:(NSString *)name
           releaseDate:(NSDate *)releaseDate
            filmRating:(NSNumber *)filmRating
                rating:(NSNumber *)rating {
    return [[Film alloc] initWithData:@{ @"name": name,
                                         @"filmRating": filmRating,
                                         @"releaseDate": @([releaseDate timeIntervalSince1970]),
                                         @"rating": rating }];
}

@end
