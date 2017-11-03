//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"
#import "MoviesListTableViewCell.h"
#import <DateTools/DateTools.h>
#import "MoviesListViewOutput.h"
#import "AppDelegate.h"
#import "Film.h"

static NSString * const MoviesListCellIdentifier = @"MoviesListCell";

@interface MoviesListViewController ()

@property (nonatomic) NSArray *moviesList;

@end

@implementation MoviesListViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
	[super viewDidLoad];

    [self.output didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate getFilmWithCallback:^(Film *film) {
      dispatch_async(dispatch_get_main_queue(), ^{
        self.moviesList = @[film];
      });
    }];
}

#pragma mark - Setters

- (void)setMoviesList:(NSArray *)moviesList {
  if (moviesList != _moviesList) {
    _moviesList = moviesList;
    [self.tableView reloadData];
  }
}

#pragma mark - MoviesListViewInput

- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.moviesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MoviesListTableViewCell * cell =
  [tableView dequeueReusableCellWithIdentifier:MoviesListCellIdentifier
                                  forIndexPath:indexPath];
  
  Film *film = self.moviesList[indexPath.row];
  cell.name.text = film.name;
  cell.date.text = [film.releaseDate formattedDateWithStyle:NSDateFormatterLongStyle];
  
  NSString *filmRatingText;
  switch (film.filmRating) {
    case G:
      filmRatingText = @"G";
    case PG:
      filmRatingText = @"PG";
    case PG13:
      filmRatingText = @"PG13";
    case R:
      filmRatingText = @"R";
    default:
      break;
  }
  cell.filmRating.text = filmRatingText;
  cell.rating.text = [[NSNumber numberWithInteger:film.rating] stringValue];
  
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
  Film *film = self.moviesList[indexPath.row];
  //TODO: Present details view controller for this film here.
}

@end
