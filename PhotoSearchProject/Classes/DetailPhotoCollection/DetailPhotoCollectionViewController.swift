//
//  DetailPhotoCollectionViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionDisplayLogic: AnyObject {
    func displayData(viewModel: DetailPhotoCollection.Model.ViewModel.ViewModelData)
}

class DetailPhotoCollectionViewController: UIViewController, DetailPhotoCollectionDisplayLogic {

    var interactor: DetailPhotoCollectionBusinessLogic?
    var router: (NSObjectProtocol & DetailPhotoCollectionRoutingLogic)?

    //MARK: - Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    //MARK: - Setup

    private func setup() {
        let viewController        = self
        let interactor            = DetailPhotoCollectionInteractor()
        let presenter             = DetailPhotoCollectionPresenter()
        let router                = DetailPhotoCollectionRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }

    //MARK: - Routing

    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func displayData(viewModel: DetailPhotoCollection.Model.ViewModel.ViewModelData) {

    }

}
