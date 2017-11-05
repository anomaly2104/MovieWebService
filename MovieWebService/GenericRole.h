//
//  GenericRole.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface GenericRole : NSObject

@property (readonly, nonatomic, copy) NSString *name;
@property (readonly, nonatomic, copy) NSString *biography;
@property (readonly, nonatomic, strong) NSDate *dateOfBirth;
@property (readonly, nonatomic) BOOL nominated;

@property (readonly, nonatomic, weak) Movie *movie;

- (id)initWithData:(NSDictionary *)data
          forMovie:(Movie *)movie;

@end
