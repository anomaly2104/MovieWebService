//
//  DetailsInteractor.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsInteractor: DetailsInteractorInput {
    var movieName: String
    var dataStore: DataStore
    weak var output: DetailsInteractorOutput!
    
    
    init(withMovieName movieName: String, dataStore: DataStore) {
        self.movieName = movieName
        self.dataStore = dataStore;
    }
    
    // MARK: - DetailsInteractorInput
    
    func findMovie() {
        dataStore.getMovieWithName(movieName) { [weak self] (movie) in
            self?.output.foundMovie(movie: movie)
        }
    }
}
