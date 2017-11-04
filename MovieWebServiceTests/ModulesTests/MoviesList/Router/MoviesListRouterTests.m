//
//  MoviesListRouterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListRouter.h"
#import "MovieWebService-Swift.h"

@interface MoviesListRouterTests : XCTestCase

@property (nonatomic, strong) MoviesListRouter *router;
@property (nonatomic, strong) id mockViewController;
@property (nonatomic, strong) id mockDetailBuilder;

@end

@implementation MoviesListRouterTests

- (void)setUp {
    [super setUp];

    self.mockViewController = OCMClassMock([UIViewController class]);
    self.mockDetailBuilder = OCMClassMock([DetailsModuleBuilder class]);

    self.router = [[MoviesListRouter alloc] init];
    self.router.viewController = self.mockViewController;
    self.router.detailBuilder = self.mockDetailBuilder;
}

- (void)tearDown {
    self.router = nil;
    self.mockDetailBuilder = nil;
    self.mockViewController = nil;
    
    [super tearDown];
}

- (void)testItCorrectlyPresentDetailControllerWhenAsked {
    NSString *movieName = @"MovieName";
    UIViewController *mockDetailViewController = OCMClassMock([UIViewController class]);
    
    [[[self.mockDetailBuilder expect] andReturn:mockDetailViewController] buildWithMovieName:movieName];

    [[self.mockViewController expect] showViewController:mockDetailViewController
                                                  sender:self.mockViewController];
    
    [self.router presentMovieDetailInterfaceForMovieWithName:movieName];
    
    [self.mockViewController verify];
    [self.mockDetailBuilder verify];
}

@end
