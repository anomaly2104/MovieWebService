//
//  Movie_DisplayAdditions_Tests.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Movie+DisplayAdditions.h"
#import <DateTools/DateTools.h>

@interface Movie_DisplayAdditions_Tests : XCTestCase

@end

@implementation Movie_DisplayAdditions_Tests

- (void)testDisplayTextForReleaseDateWithDoubleDigitDay {
    NSTimeInterval testDate = [[NSDate dateWithYear:2012 month:12 day:10] timeIntervalSince1970];
    Movie *movie = [[Movie alloc] initWithData:@{ @"releaseDate": @(testDate) }];
    XCTAssertEqualObjects(@"Dec 10, 2012", movie.releaseDateDisplayText);
}

- (void)testDisplayTextForReleaseDateWithSingleDigitDay {
    NSTimeInterval testDate = [[NSDate dateWithYear:2012 month:12 day:1] timeIntervalSince1970];
    Movie *movie = [[Movie alloc] initWithData:@{ @"releaseDate": @(testDate) }];
    XCTAssertEqualObjects(@"Dec 1, 2012", movie.releaseDateDisplayText);
}

- (void)testDisplayTextForValidFilmRatings {
    for (NSArray *filmRating in [self allFilmRatings]) {
        Movie *movie = [[Movie alloc] initWithData:@{ @"filmRating": filmRating.firstObject }];
        XCTAssertEqualObjects(filmRating.lastObject, movie.filmRatingDisplayText);
    }
}

- (void)testDisplayTextForInvalidFilmRating {
    Movie *movie = [[Movie alloc] initWithData:@{ @"filmRating": @(100) }];
    XCTAssertEqualObjects(@"Invalid Rating", movie.filmRatingDisplayText);
}

- (void)testDisplayTextForRating {
    Movie *movie = [[Movie alloc] initWithData:@{ @"rating": @(2.3) }];
    XCTAssertEqualObjects(@"2.3", movie.ratingDisplayText);
}

- (NSArray *)allFilmRatings {
    return @[ @[@(0), @"G"],
              @[@(1), @"PG"],
              @[@(2), @"PG13"],
              @[@(3), @"R"]];
}

@end
