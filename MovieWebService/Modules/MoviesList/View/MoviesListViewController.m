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
#import "MoviesListDisplayItem.h"

static NSString * const MoviesListCellIdentifier = @"MoviesListCell";
#define NavigationTitle NSLocalizedString(@"Root View Controller", @"Navigation title for root view controller")

@interface MoviesListViewController ()

@property (nonatomic) NSArray *moviesList;

@end

@implementation MoviesListViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.output updateView];
}

- (void)configureView {
    self.navigationItem.title = NavigationTitle;
}

#pragma mark - Setters

- (void)setMoviesList:(NSArray *)moviesList {
    if (moviesList != _moviesList) {
        _moviesList = moviesList;
        [self.tableView reloadData];
    }
}

#pragma mark - MoviesListViewInput

- (void)showMoviesList:(NSArray *)moviesList {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.moviesList = moviesList;
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoviesListTableViewCell * cell =
    [tableView dequeueReusableCellWithIdentifier:MoviesListCellIdentifier
                                    forIndexPath:indexPath];
    
    MoviesListDisplayItem *displayItem = self.moviesList[indexPath.row];
    [cell setNameText:displayItem.name];
    [cell setReleaseDateText:displayItem.releaseDate];
    [cell setFilmRatingText:displayItem.filmRating];
    [cell setRatingText:displayItem.rating];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MoviesListDisplayItem *displayItem = self.moviesList[indexPath.row];
    [self.output selectedMovie:displayItem];
}

@end
