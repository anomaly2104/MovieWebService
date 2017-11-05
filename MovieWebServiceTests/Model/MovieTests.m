//
//  MovieTests.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/5/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Movie.h"

@interface MovieTests : XCTestCase

@end

@implementation MovieTests

- (void)testGenericRoleDataIsParsedCorrectly {
    NSDate *releaseDate = [NSDate distantFuture];
    NSDate *actorDob = [NSDate distantPast];
    NSDate *directorDob = [NSDate distantPast];
    
    NSDictionary *data = @{@"filmRating": @3,
                           @"languages": @[ @"English", @"Thai" ],
                           @"nominated": @1,
                           @"releaseDate": @(releaseDate.timeIntervalSince1970),
                           @"casts": @[ @{@"dateOfBirth": @(actorDob.timeIntervalSince1970),
                                          @"nominated": @1,
                                          @"name": @"Actor Name",
                                          @"screenName": @"Actor Screen Name",
                                          @"biography": @"Actor Biography"
                                          }
                                        ],
                           @"name": @"Movie Name",
                           @"rating": @7.8,
                           @"director": @{ @"dateOfBirth": @(directorDob.timeIntervalSince1970),
                                           @"nominated": @1,
                                           @"name": @"Director Name",
                                           @"biography": @"Director Biography."
                                           }
                           };
    
    
    Movie *movie = [[Movie alloc] initWithData:data];
    
    XCTAssertEqual(3, movie.filmRating);
    XCTAssertEqualObjects(releaseDate, movie.releaseDate);
    XCTAssertEqualObjects(@"Movie Name", movie.name);
    XCTAssertEqual(7.8, movie.rating);
    
    XCTAssertEqual(2, movie.languages.count);
    XCTAssertEqualObjects(@"English", movie.languages.firstObject);
    XCTAssertEqualObjects(@"Thai", movie.languages.lastObject);
    
    XCTAssertNotNil(movie.director);
    Director *director = movie.director;
    XCTAssertEqualObjects(@"Director Name", director.name);
    XCTAssertEqualObjects(@"Director Biography.", director.biography);
    XCTAssertEqualObjects(directorDob, director.dateOfBirth);
    XCTAssertTrue(director.nominated);
    XCTAssertEqual(movie, director.movie);
    
    XCTAssertEqual(1, movie.cast.count);
    Actor *actor = movie.cast.firstObject;
    XCTAssertEqualObjects(@"Actor Name", actor.name);
    XCTAssertEqualObjects(@"Actor Screen Name", actor.screenName);
    XCTAssertEqualObjects(@"Actor Biography", actor.biography);
    XCTAssertEqualObjects(actorDob, actor.dateOfBirth);
    XCTAssertTrue(actor.nominated);
    XCTAssertEqual(movie, actor.movie);
}

@end
