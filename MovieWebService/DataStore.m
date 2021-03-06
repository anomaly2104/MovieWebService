//
//  DataStore.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "DataStore.h"
#import "Movie.h"
#import <TDTChocolate/TDTFoundationAdditions.h>

@implementation DataStore

- (void)getMoviesWithCallback:(void (^)(NSArray<Movie *> *movies))callback {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSDictionary *data = @{@"filmRating": @3,
                               @"languages": @[ @"English", @"Thai" ],
                               @"nominated": @1,
                               @"releaseDate": @1350000000,
                               @"casts": @[ @{@"dateOfBirth": @-436147200,
                                              @"nominated": @1,
                                              @"name": @"Bryan Cranston",
                                              @"screenName": @"Jack Donnell",
                                              @"biography": @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
                                              }
                                            ],
                               @"name": @"Argo",
                               @"rating": @7.8,
                               @"director": @{ @"dateOfBirth": @82684800,
                                               @"nominated": @1,
                                               @"name": @"Ben Affleck",
                                               @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                                               }
                               };
        
        Movie *movie = [[Movie alloc] initWithData:data];
        callback(@[movie]);
    });
}

- (void)getMovieWithName:(NSString *)movieName
                callback:(void (^)(Movie *movie))callback {
    [self getMoviesWithCallback:^(NSArray<Movie *> *movies) {
        Movie *movie = [movies tdt_objectPassingTest:^BOOL(Movie *movie) {
            return [movie.name isEqualToString:movieName];
        }];
        callback(movie);
    }];
}

@end
