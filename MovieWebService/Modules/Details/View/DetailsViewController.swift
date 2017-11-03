//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput, TappableLabelDelegate {

    var output: DetailsViewOutput!

    var directorName: UILabel!
    var directorNameValue: UILabel!
    var tapToShowMore: TappableLabel!
    var actorName: UILabel!
    var actorScreenName: UILabel!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .white

        directorName = UILabel()
        view.addSubview(directorName)
        directorName.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
        directorName.text = "Director Name"

        directorNameValue = UILabel()
        view.addSubview(directorNameValue)
        directorNameValue.frame = CGRect(x: 20, y: 150, width: 200, height: 30)

        tapToShowMore = TappableLabel()
        view.addSubview(tapToShowMore)
        tapToShowMore.frame = CGRect(x: 20, y: 200, width: 200, height: 30)
        tapToShowMore.text = "Tap here to show more"
        tapToShowMore.delegate = self

        actorName = UILabel()
        view.addSubview(actorName)
        actorName.frame = CGRect(x: 20, y: 240, width: 200, height: 30)

        actorScreenName = UILabel()
        view.addSubview(actorScreenName)
        actorScreenName.frame = CGRect(x: 20, y: 270, width: 200, height: 30)
        actorName.isHidden = true
        actorScreenName.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.updateView()
    }

    // MARK: DetailsViewInput
    
    func showDetailsForMovie(movie movieOp: Film?) {
        if let movie = movieOp {
            DispatchQueue.main.async { [weak self] in
                if let sself = self {
                    sself.directorNameValue.text = movie.director.name
                    if let actor = movie.cast?.firstObject as? Actor {
                        sself.actorName.text = actor.name
                        sself.actorScreenName.text = actor.screenName
                    }
                }
            }
        }
    }

    func didReceiveTouch() {
        actorName.isHidden = false
        actorScreenName.isHidden = false
    }

}
