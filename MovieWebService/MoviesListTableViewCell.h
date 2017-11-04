//
//  MoviesListTableViewCell.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesListTableViewCell : UITableViewCell

- (void)setNameText:(NSString *)nameText;
- (void)setReleaseDateText:(NSString *)releaseDateText;
- (void)setFilmRatingText:(NSString *)filmRatingText;
- (void)setRatingText:(NSString *)ratingText;

@end
