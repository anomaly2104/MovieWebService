//
//  MoviesListTableViewCell.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MoviesListTableViewCell.h"

@interface MoviesListTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *filmRating;
@property (strong, nonatomic) IBOutlet UILabel *rating;

@end

@implementation MoviesListTableViewCell

- (void)setNameText:(NSString *)nameText {
    self.name.text = nameText;
}

- (void)setReleaseDateText:(NSString *)releaseDateText {
    self.date.text = releaseDateText;
}

- (void)setFilmRatingText:(NSString *)filmRatingText {
    self.filmRating.text = filmRatingText;
}

- (void)setRatingText:(NSString *)ratingText {
    self.rating.text = ratingText;
}

@end
