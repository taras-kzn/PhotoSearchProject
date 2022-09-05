//
//  FavoriteDetailPhotoViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteDetailPhotoDisplayLogic: class {
  func displayData(viewModel: FavoriteDetailPhoto.Model.ViewModel.ViewModelData)
}

class FavoriteDetailPhotoViewController: UIViewController, FavoriteDetailPhotoDisplayLogic {

  var interactor: FavoriteDetailPhotoBusinessLogic?
  var router: (NSObjectProtocol & FavoriteDetailPhotoRoutingLogic)?

  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: Setup

  private func setup() {
    let viewController        = self
    let interactor            = FavoriteDetailPhotoInteractor()
    let presenter             = FavoriteDetailPhotoPresenter()
    let router                = FavoriteDetailPhotoRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }

  // MARK: Routing

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func displayData(viewModel: FavoriteDetailPhoto.Model.ViewModel.ViewModelData) {

  }

}
