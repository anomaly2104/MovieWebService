//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsPresenter: DetailsModuleInput, DetailsViewOutput, DetailsInteractorOutput {

    weak var view: DetailsViewInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!

    // MARK: - DetailsViewOutput
    
    func updateView() {
        interactor.findMovie()
    }
    
    // MARK: - DetailsInteractorOutput
    
    func foundMovie(movie: Film?) {
        let detailDisplayItem = createDetailDisplayItemFromMovie(movieOptional: movie)
        view.showDetailsForDetailDisplayItem(detailDisplayItem: detailDisplayItem)
    }
    
    func createDetailDisplayItemFromMovie(movieOptional: Film?) -> DetailDisplayItem {
        let detailDisplayItem = DetailDisplayItem()
        
        if let movie = movieOptional {
            detailDisplayItem.directorName = movie.director.name
            if let actor = movie.cast.first {
                detailDisplayItem.actorName = actor.name
                detailDisplayItem.actorScreenName = actor.screenName
            }
        }
        
        return detailDisplayItem
    }
}
