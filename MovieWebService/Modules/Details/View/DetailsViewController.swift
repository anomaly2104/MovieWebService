//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput {

    var output: DetailsViewOutput!

    @IBOutlet weak var directorNameValue: UILabel!
    @IBOutlet weak var tapToShowMore: UILabel!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorScreenName: UILabel!
    @IBOutlet weak var actorContentView: UIView!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super .viewDidLoad()
        actorContentView.isHidden = true
        updateTapShowMoreOrLessLabelText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.updateView()
    }

    // MARK: DetailsViewInput
    
    func showDetailsForDetailDisplayItem(detailDisplayItem: DetailDisplayItem) {
        DispatchQueue.main.async { [weak self] in
            if let sself = self {
                sself.directorNameValue.text = detailDisplayItem.directorName
                sself.actorName.text = detailDisplayItem.actorName
                sself.actorScreenName.text = detailDisplayItem.actorScreenName
            }
        }
    }

    // MARK: TappableLabelDelegate
    
    @IBAction func showMoreOrLessTapped(_ sender: Any) {
        actorContentView.isHidden = !actorContentView.isHidden
        updateTapShowMoreOrLessLabelText()
    }
    
    func updateTapShowMoreOrLessLabelText() {
        if actorContentView.isHidden {
            tapToShowMore.text = NSLocalizedString("Tap here to show more", comment: "Tap here to show more")
        } else {
            tapToShowMore.text = NSLocalizedString("Tap here to show less", comment: "Tap here to show less")
        }
    }

}
