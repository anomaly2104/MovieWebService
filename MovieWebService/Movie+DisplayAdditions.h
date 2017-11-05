//
//  Movie+DisplayAdditions.h
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Movie.h"

@interface Movie (DisplayAdditions)

- (NSString *)releaseDateDisplayText;

- (NSString *)filmRatingDisplayText;

- (NSString *)ratingDisplayText;

@end
