//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MoviesListDisplayItem.h"
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <DateTools/DateTools.h>
#import "Movie+DisplayAdditions.h"

@implementation MoviesListPresenter

#pragma mark - Методы MoviesListViewOutput

- (void)updateView {
    [self.interactor findMoviesList];
}

- (void)selectedMovie:(MoviesListDisplayItem *)movieListDisplayItem {
    [self.router presentMovieDetailInterfaceForMovieWithName:movieListDisplayItem.name];
}

#pragma mark - Методы MoviesListInteractorOutput

- (void)foundMoviesList:(NSArray *)moviesList {
    NSArray *moviesListDisplay = [moviesList tdt_arrayByMappingWithBlock:^MoviesListDisplayItem *(Movie *movie) {
        MoviesListDisplayItem *displayItem = [MoviesListDisplayItem new];
        displayItem.name = movie.name;
        displayItem.releaseDate = movie.releaseDateDisplayText;
        displayItem.filmRating = movie.filmRatingDisplayText;
        displayItem.rating = movie.ratingDisplayText;
        
        return displayItem;
    }];
    [self.view showMoviesList:moviesListDisplay];
}

@end
