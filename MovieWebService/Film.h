//
//  Film.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Actor.h"
#import "Director.h"

typedef enum {
    G = 0,
    PG,
    PG13,
    R,
    NC17
} FilmRating;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject

@property (readonly, nonatomic) FilmRating filmRating;
@property (readonly, nonatomic) NSArray *languages;
@property (readonly, nonatomic) NSDate *releaseDate;
@property (readonly, nonatomic) NSArray<Actor*> *cast;
@property (readonly, nonatomic, copy) NSString *name;
@property (readonly, nonatomic) double rating;
@property (readonly, nonatomic, strong) Director *director;
@property (readonly, nonatomic) BOOL nominated;

- (id)initWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
