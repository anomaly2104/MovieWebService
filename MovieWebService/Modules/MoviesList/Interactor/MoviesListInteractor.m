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
#import "Masonry.h"
#import "AppDelegate.h"
#import "MovieWebService-Swift.h"
#import <DateTools/NSDate+DateTools.h>

@implementation MoviesListInteractor

#pragma mark - MoviesListInteractorInput

- (void)findMoviesList {
    __weak typeof(self) welf = self;
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate getFilmWithCallback:^(Film *film) {
        [welf.output foundMoviesList:@[film]];
    }];
}

@end
