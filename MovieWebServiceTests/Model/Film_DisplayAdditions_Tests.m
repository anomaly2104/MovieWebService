//
//  Film_DisplayAdditions_Tests.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Film+DisplayAdditions.h"
#import <DateTools/DateTools.h>

@interface Film_DisplayAdditions_Tests : XCTestCase

@end

@implementation Film_DisplayAdditions_Tests

- (void)testDisplayTextForReleaseDateWithDoubleDigitDay {
    NSTimeInterval testDate = [[NSDate dateWithYear:2012 month:12 day:10] timeIntervalSince1970];
    Film *film = [[Film alloc] initWithData:@{ @"releaseDate": @(testDate) }];
    XCTAssertEqualObjects(@"Dec 10, 2012", film.releaseDateDisplayText);
}

- (void)testDisplayTextForReleaseDateWithSingleDigitDay {
    NSTimeInterval testDate = [[NSDate dateWithYear:2012 month:12 day:1] timeIntervalSince1970];
    Film *film = [[Film alloc] initWithData:@{ @"releaseDate": @(testDate) }];
    XCTAssertEqualObjects(@"Dec 1, 2012", film.releaseDateDisplayText);
}

- (void)testDisplayTextForValidFilmRatings {
    for (NSArray *filmRating in [self allFilmRatings]) {
        Film *film = [[Film alloc] initWithData:@{ @"filmRating": filmRating.firstObject }];
        XCTAssertEqualObjects(filmRating.lastObject, film.filmRatingDisplayText);
    }
}

- (void)testDisplayTextForInvalidFilmRating {
    Film *film = [[Film alloc] initWithData:@{ @"filmRating": @(100) }];
    XCTAssertEqualObjects(@"Invalid Rating", film.filmRatingDisplayText);
}

- (void)testDisplayTextForRating {
    Film *film = [[Film alloc] initWithData:@{ @"rating": @(2.3) }];
    XCTAssertEqualObjects(@"2.3", film.ratingDisplayText);
}

- (NSArray *)allFilmRatings {
    return @[ @[@(0), @"G"],
              @[@(1), @"PG"],
              @[@(2), @"PG13"],
              @[@(3), @"R"]];
}

@end
