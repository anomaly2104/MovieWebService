//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "AppDelegate.h"
#import "DataStore.h"

@implementation MoviesListInteractor

#pragma mark - MoviesListInteractorInput

- (void)findMoviesList {
    __weak typeof(self) welf = self;
    [self.dataStore getMoviesWithCallback:^(NSArray<Film *> *movies) {
        [welf.output foundMoviesList:movies];
    }];
}

@end
