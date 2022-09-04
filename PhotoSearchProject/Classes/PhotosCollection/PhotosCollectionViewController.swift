//
//  PhotosCollectionViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PhotosCollectionDisplayLogic: AnyObject {
  func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData)
}

class PhotosCollectionViewController: UIViewController, PhotosCollectionDisplayLogic {

  var interactor: PhotosCollectionBusinessLogic?
  var router: (NSObjectProtocol & PhotosCollectionRoutingLogic)?

  // MARK: Setup

  private func setup() {
    let viewController        = self
    let interactor            = PhotosCollectionInteractor()
    let presenter             = PhotosCollectionPresenter()
    let router                = PhotosCollectionRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
      setup()
      view.backgroundColor = .yellow
  }

  func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData) {

  }
}
