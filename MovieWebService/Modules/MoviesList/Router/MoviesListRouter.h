//
//  MoviesListRouter.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListRouterInput.h"

@class UIViewController, DetailsModuleBuilder;

@interface MoviesListRouter : NSObject <MoviesListRouterInput>

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, strong) DetailsModuleBuilder *detailBuilder;

@end
