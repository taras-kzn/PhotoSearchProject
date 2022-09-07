//
//  FavoriteDetailPhotoViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoriteDetailPhotoDisplayLogic: AnyObject {
    func displayData(viewModel: FavoriteDetailPhoto.Model.ViewModel.ViewModelData)
}

class FavoriteDetailPhotoViewController: UIViewController {

    var interactor: FavoriteDetailPhotoBusinessLogic?
    var router: (NSObjectProtocol & FavoriteDetailPhotoRoutingLogic)?
    private var photo = DetailsPhotoViewModel(name: "", date: "", location: "", download: "", created_at: "", photoUrlString: "")

    //MARK: - UIElements
    private let photoImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.init(red: 0.784, green: 0.781, blue: 0.805, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let iconNameImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .black
        return imageView
    }()

    private let nameLabeL: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let iconDateImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .black
        return imageView
    }()

    private let dateLabeL: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let iconLocationImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "location")
        imageView.tintColor = .black
        return imageView
    }()

    private let locationLabeL: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private let iconDownloadImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "square.and.arrow.down")
        imageView.tintColor = .black
        return imageView
    }()

    private let downloadLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    private let addPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Deleted photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.layer.cornerRadius = 16
        return button
    }()

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getPhoto()
        setupPhotoImageView()
        setupConstraintsElements()
    }

    //MARK: - setup
    private func setup() {
        view.backgroundColor = UIColor.init(red: 0.784, green: 0.781, blue: 0.805, alpha: 1)
        addPhotoButton.addTarget(self, action: #selector(didClickAddButton), for: .touchUpInside)
    }

    private func getPhoto() {
        interactor?.makeRequest(request: .getDetailsPhoto)
    }

    @objc func didClickAddButton() {
        let alertController = UIAlertController(title: "", message: "photo will be deleted", preferredStyle: .alert)
        let add = UIAlertAction(title: "Deleted", style: .default) { [weak self] (action) in
            guard let self = self else { return }
            let tabbar = self.tabBarController as! MainTabBarController
            let navVC = tabbar.viewControllers?[1] as! UINavigationController
            let favoriteVC = navVC.viewControllers.first as! FavoritePhotosViewController
            self.router?.popToRootFavoritePhotos()

            for index in 0..<favoriteVC.favoritePhotos.count {
                if favoriteVC.favoritePhotos[index].photoUrlString == self.photo.photoUrlString {
                    favoriteVC.favoritePhotos.remove(at: index)
                    return
                }
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(add)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }

    //MARK: - setup Constraints UI elements
    private func setupPhotoImageView() {
        view.addSubview(photoImageView)

        photoImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
    }

    private func setupConstraintsElements(){
        view.addSubview(iconNameImageView)
        view.addSubview(nameLabeL)
        view.addSubview(iconDateImageView)
        view.addSubview(dateLabeL)
        view.addSubview(iconLocationImageView)
        view.addSubview(locationLabeL)
        view.addSubview(iconDownloadImageView)
        view.addSubview(downloadLabel)
        view.addSubview(addPhotoButton)

        NSLayoutConstraint.activate([iconNameImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
                                     iconNameImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)])

        NSLayoutConstraint.activate([nameLabeL.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
                                     nameLabeL.leadingAnchor.constraint(equalTo: iconNameImageView.trailingAnchor, constant: 16)])

        NSLayoutConstraint.activate([iconDateImageView.topAnchor.constraint(equalTo: iconNameImageView.bottomAnchor, constant: 16),
                                     iconDateImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)])

        NSLayoutConstraint.activate([dateLabeL.topAnchor.constraint(equalTo: nameLabeL.bottomAnchor, constant: 16),
                                     dateLabeL.leadingAnchor.constraint(equalTo: iconDateImageView.trailingAnchor, constant: 16)])

        NSLayoutConstraint.activate([iconLocationImageView.topAnchor.constraint(equalTo: iconDateImageView.bottomAnchor, constant: 16),
                                     iconLocationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)])

        NSLayoutConstraint.activate([locationLabeL.topAnchor.constraint(equalTo: dateLabeL.bottomAnchor, constant: 16),
                                     locationLabeL.leadingAnchor.constraint(equalTo: iconLocationImageView.trailingAnchor, constant: 16)])

        NSLayoutConstraint.activate([iconDownloadImageView.topAnchor.constraint(equalTo: iconLocationImageView.bottomAnchor, constant: 16),
                                     iconDownloadImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)])

        NSLayoutConstraint.activate([downloadLabel.topAnchor.constraint(equalTo: locationLabeL.bottomAnchor, constant: 16),
                                     downloadLabel.leadingAnchor.constraint(equalTo: iconDownloadImageView.trailingAnchor, constant: 16)])

        NSLayoutConstraint.activate([addPhotoButton.topAnchor.constraint(equalTo: iconDownloadImageView.bottomAnchor, constant: 26),
                                     addPhotoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     addPhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
    }
}

//MARK: - FavoriteDetailPhotoDisplayLogic
extension FavoriteDetailPhotoViewController: FavoriteDetailPhotoDisplayLogic {
    func displayData(viewModel: FavoriteDetailPhoto.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayDetailsPhoto(detailsPhotoViewModel: let detailsPhotoViewModel):
            photo = detailsPhotoViewModel
            nameLabeL.text = detailsPhotoViewModel.name
            dateLabeL.text = detailsPhotoViewModel.date
            locationLabeL.text = detailsPhotoViewModel.location
            downloadLabel.text = detailsPhotoViewModel.download
            photoImageView.set(imageUrl: detailsPhotoViewModel.photoUrlString)
        }
    }
}
