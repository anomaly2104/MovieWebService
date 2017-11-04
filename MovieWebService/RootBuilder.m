//
//  RootBuilder.m
//  MovieWebService
//
//  Created by Agarwal, Udit on 11/4/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "RootBuilder.h"

@implementation RootBuilder

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window {
    UINavigationController *navigationController = [self navigationControllerWithRootViewController:viewController];
    window.rootViewController = navigationController;
}


- (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController {
    
    UINavigationController *navigationController = [UINavigationController new];
    navigationController.viewControllers = @[viewController];
    return navigationController;
}

@end
