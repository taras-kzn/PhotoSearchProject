//
//  DetailPhotoCollectionViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionDisplayLogic: AnyObject {
    func displayData(viewModel: DetailPhotoCollection.Model.ViewModel.ViewModelData)
}

class DetailPhotoCollectionViewController: UIViewController {
    //MARK: - Properties
    var interactor: DetailPhotoCollectionBusinessLogic?
    var router: (NSObjectProtocol & DetailPhotoCollectionRoutingLogic)?

    let photoImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    //MARK: - Routing

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        getDetailsPhoto()

    }

    private func setup() {
        view.backgroundColor = .blue
    }


    //MARK: - methods
    private func getDetailsPhoto() {
        interactor?.makeRequest(request: .getDetailsPhoto)
    }
}

//MARK: - DetailPhotoCollectionDisplayLogic
extension DetailPhotoCollectionViewController: DetailPhotoCollectionDisplayLogic {

    func displayData(viewModel: DetailPhotoCollection.Model.ViewModel.ViewModelData) {

    }
}

//MARK: - SwiftUI
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = DetailPhotoCollectionViewController()

        func makeUIViewController(context: Context) -> some DetailPhotoCollectionViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
