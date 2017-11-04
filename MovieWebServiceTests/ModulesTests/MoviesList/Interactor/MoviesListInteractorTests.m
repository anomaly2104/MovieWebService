//
//  MoviesListInteractorTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "DataStore.h"

@interface MoviesListInteractorTests : XCTestCase

@property (nonatomic, strong) MoviesListInteractor *interactor;

@property (nonatomic, strong) id mockOutput;
@property (nonatomic, strong) id mockDataStore;

@end

@implementation MoviesListInteractorTests

- (void)setUp {
    [super setUp];

    self.interactor = [[MoviesListInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListInteractorOutput));
    self.mockDataStore = OCMClassMock([DataStore class]);

    self.interactor.output = self.mockOutput;
    self.interactor.dataStore = self.mockDataStore;
}

- (void)tearDown {
    self.interactor = nil;
    self.mockOutput = nil;
    self.mockDataStore = nil;
    
    [super tearDown];
}

- (void)testItCallsDataStoreToFetchMoviesList {
    [[self.mockDataStore expect] getMoviesWithCallback:OCMOCK_ANY];
    
    [self.interactor findMoviesList];
    
    [self.mockDataStore verify];
}

- (void)testFoundMoviesListFromInteractorWillHaveItemsReceivedFromDataStore {
    NSArray *mockMovieList = OCMClassMock([NSArray class]);
    [[[self.mockDataStore stub] andDo:^(NSInvocation *invocation) {
        void (^completionBlock)(NSArray<Film *> *movies) = NULL;
        [invocation getArgument:&completionBlock atIndex:2];
        completionBlock(mockMovieList);
    }] getMoviesWithCallback:OCMOCK_ANY];
    
    [[self.mockOutput expect] foundMoviesList:mockMovieList];
    
    [self.interactor findMoviesList];
    
    [self.mockOutput verify];
}

@end
