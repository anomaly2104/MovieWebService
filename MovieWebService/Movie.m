//
//  Movie.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Movie.h"
#import "Actor.h"
#import "Director.h"

@implementation Movie

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _filmRating = [data[@"filmRating"] doubleValue];
        _languages = data[@"languages"];
        _nominated = [data[@"nominated"] boolValue];
        _releaseDate = [NSDate dateWithTimeIntervalSince1970:[data[@"releaseDate"] doubleValue]];
        _name = data[@"name"];
        _rating = [data[@"rating"] doubleValue];
        _director = [[Director alloc] initWithData:data[@"director"] forMovie:self];
        NSMutableArray *castsList = [@[] mutableCopy];
        NSArray *castsData = data[@"casts"];
        for (NSDictionary *castData in castsData) {
            Actor *actor = [[Actor alloc] initWithData:castData forMovie:self];
            [castsList addObject:actor];
        }
        _cast = [castsList copy];
    }
    return self;
}

@end
