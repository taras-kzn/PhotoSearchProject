//
//  PhotosCollectionViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionDisplayLogic: AnyObject {
  func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData)
}

class PhotosCollectionViewController: UIViewController {

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
      navigationItem.title = "Photos"
  }
}

//MARK: - PhotosCollectionDisplayLogic
extension PhotosCollectionViewController: PhotosCollectionDisplayLogic {

    func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData) {

    }
}
