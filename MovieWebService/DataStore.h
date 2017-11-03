//
//  DataStore.h
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface DataStore : NSObject

- (void)getMoviesWithCallback:(void (^)(NSArray<Film *> *movies))callback;

- (void)getMovieWithName:(NSString *)movieName
                callback:(void (^)(Film *movie))callback;

@end
