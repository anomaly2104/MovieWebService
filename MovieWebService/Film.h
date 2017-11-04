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

@property (nonatomic) FilmRating filmRating;
@property (nonatomic) NSArray *languages;
@property (nonatomic) NSDate *releaseDate;
@property (nonatomic) NSArray<Actor*> *cast;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) double rating;
@property (nonatomic, strong) Director *director;
@property (nonatomic) BOOL nominated;

- (id)initWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
