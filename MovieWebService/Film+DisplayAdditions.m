//
//  Film+DisplayAdditions.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film+DisplayAdditions.h"
#import <DateTools/DateTools.h>

#define InvalidRating NSLocalizedString(@"Invalid Rating", @"Text for invalid value of film rating.");

@implementation Film (DisplayAdditions)

- (NSString *)releaseDateDisplayText {
    return [self.releaseDate formattedDateWithStyle:NSDateFormatterMediumStyle];
}

- (NSString *)filmRatingDisplayText {
    switch (self.filmRating) {
        case G:
            return @"G";
        case PG:
            return @"PG";
        case PG13:
            return @"PG13";
        case R:
            return @"R";
        default:
            break;
    }
    return InvalidRating;
}

- (NSString *)ratingDisplayText {
    return [NSNumber numberWithDouble:self.rating].stringValue;
}

@end
