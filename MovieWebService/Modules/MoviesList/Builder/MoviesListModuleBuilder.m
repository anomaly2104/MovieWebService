//
//  MoviesListModuleBuilder.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListModuleBuilder.h"

#import "MoviesListViewController.h"
#import "MoviesListInteractor.h"
#import "MoviesListPresenter.h"
#import "MoviesListRouter.h"
#import "DataStore.h"
#import "MovieWebService-Swift.h"

static NSString *MoviesListControllerIdentifier = @"MoviesListController";

@implementation MoviesListModuleBuilder

- (UIViewController *)build {
    
    MoviesListViewController *viewController = [self moviesListViewController];

    MoviesListRouter *router = [MoviesListRouter new];
    router.viewController = viewController;
    router.detailBuilder = [DetailsModuleBuilder new];
    
    MoviesListPresenter *presenter = [MoviesListPresenter new];
    presenter.view = viewController;
    presenter.router = router;

    MoviesListInteractor *interactor = [MoviesListInteractor new];
    interactor.output = presenter;
    interactor.dataStore = [DataStore new];
    presenter.interactor = interactor;
    viewController.output = presenter;
    
    return viewController;
}

- (MoviesListViewController *)moviesListViewController {
    UIStoryboard *storyboard = [self mainStoryboard];
    MoviesListViewController *moviesListViewController =
    [storyboard instantiateViewControllerWithIdentifier:MoviesListControllerIdentifier];
    
    return moviesListViewController;
}


- (UIStoryboard *)mainStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
