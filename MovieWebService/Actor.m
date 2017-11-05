//
//  Actor.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (id)initWithData:(NSDictionary *)data forMovie:(Movie *)movie {
    self = [super initWithData:data forMovie:movie];
    if (self) {
        _screenName = data[@"screenName"];
    }
    return self;
}

@end
