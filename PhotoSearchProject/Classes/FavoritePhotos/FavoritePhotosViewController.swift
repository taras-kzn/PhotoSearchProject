//
//  FavoritePhotosViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosDisplayLogic: AnyObject {
    func displayData(viewModel: FavoritePhotos.Model.ViewModel.ViewModelData)
}

class FavoritePhotosViewController: UIViewController, FavoritePhotosDisplayLogic {
    //MARK: - Properties
    var interactor: FavoritePhotosBusinessLogic?
    var router: (NSObjectProtocol & FavoritePhotosRoutingLogic)?

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }

    func displayData(viewModel: FavoritePhotos.Model.ViewModel.ViewModelData) {

    }
}
