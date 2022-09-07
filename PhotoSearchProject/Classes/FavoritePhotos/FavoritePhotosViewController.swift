//
//  FavoritePhotosViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosDisplayLogic: AnyObject {
    func displayData(viewModel: FavoritePhotos.Model.ViewModel.ViewModelData)
}

class FavoritePhotosViewController: UIViewController {
    //MARK: - Properties
    var interactor: FavoritePhotosBusinessLogic?
    var router: (NSObjectProtocol & FavoritePhotosRoutingLogic)?
    var tableView: UITableView!
    var favoritePhotos = [DetailsPhotoViewModel]()

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    //MARK: - Setup
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(FavoritePhotoCell.self, forCellReuseIdentifier: FavoritePhotoCell.reuseId)
        tableView.showsVerticalScrollIndicator = false
    }
}

//MARK: - FavoritePhotosDisplayLogic
extension FavoritePhotosViewController: FavoritePhotosDisplayLogic {
    func displayData(viewModel: FavoritePhotos.Model.ViewModel.ViewModelData) {

    }
}

extension FavoritePhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePhotos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritePhotoCell.reuseId, for: indexPath) as? FavoritePhotoCell else { fatalError("Could not dequeue cell with identifier: (T.defaultReuseIdentifier)") }
        let photo = favoritePhotos[indexPath.row]
        cell.set(viewModel: photo)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = favoritePhotos[indexPath.row]
        router?.showDetailFavoritePhoto(viewModel: viewModel)
    }
}

extension FavoritePhotosViewController: UITableViewDelegate {

}
