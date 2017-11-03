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

@implementation MoviesListPresenter

#pragma mark - Методы MoviesListModuleInput

- (void)configureModule {
 }

#pragma mark - Методы MoviesListViewOutput

- (void)updateView {
    [self.interactor findMoviesList];
}

#pragma mark - Методы MoviesListInteractorOutput

- (void)foundMoviesList:(NSArray *)moviesList {
    [self.view showMoviesList:moviesList];
}

@end
