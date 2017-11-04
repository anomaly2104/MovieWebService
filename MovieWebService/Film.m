//
//  Film.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film.h"
#import "Actor.h"
#import "Director.h"

@implementation Film

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.filmRating = [data[@"filmRating"] doubleValue];
        self.languages = data[@"languages"];
        self.nominated = [data[@"nominated"] boolValue];
        self.releaseDate = [NSDate dateWithTimeIntervalSince1970:[data[@"releaseDate"] doubleValue]];
        self.name = data[@"name"];
        self.rating = [data[@"rating"] doubleValue];
        _director = [[Director alloc] initWithData:data[@"director"] forMovie:self];
        NSMutableArray *castsList = [@[] mutableCopy];
        NSArray *castsData = data[@"casts"];
        for (NSDictionary *castData in castsData) {
            Actor *actor = [[Actor alloc] initWithData:castData forMovie:self];
            [castsList addObject:actor];
        }
        self.cast = [castsList copy];
    }
    return self;
}

@end
