//
//  Film+DisplayAdditions.h
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film.h"

@interface Film (DisplayAdditions)

- (NSString *)releaseDateDisplayText;

- (NSString *)filmRatingDisplayText;

- (NSString *)ratingDisplayText;

@end
