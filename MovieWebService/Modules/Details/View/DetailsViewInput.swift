//
//  DetailsViewInput.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

protocol DetailsViewInput: class {
    func showDetailsForDetailDisplayItem(detailDisplayItem: DetailDisplayItem)
    func displayShowMoreText()
    func displayShowLessText()
    func showActorContent()
    func hideActorContent()
}
