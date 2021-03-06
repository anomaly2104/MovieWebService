//
//  MoviesListInteractor.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractorInput.h"

@class DataStore;

@protocol MoviesListInteractorOutput;

@interface MoviesListInteractor : NSObject <MoviesListInteractorInput>

@property (nonatomic, weak) id<MoviesListInteractorOutput> output;
@property (nonatomic) DataStore *dataStore;

@end
