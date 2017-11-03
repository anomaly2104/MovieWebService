//
//  DetailsModuleBuilder.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

@objc class DetailsModuleBuilder: NSObject {
    private let MovieDetailsViewControllerIdentifier = "MovieDetailsViewController"
    
    func build(withMovieName movieName: String) -> UIViewController {
        
        let viewController = movieDetailViewControllerFromStoryboard()

        let router = DetailsRouter()
        router.viewController = viewController

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let dataStore = DataStore()
        
        let interactor = DetailsInteractor(withMovieName: movieName, dataStore: dataStore)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
    
    func movieDetailViewControllerFromStoryboard() -> DetailsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: MovieDetailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
