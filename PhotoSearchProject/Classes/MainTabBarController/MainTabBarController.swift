//
//  MainTabBarController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    //MARK: - properties
    let navigationPhotoCollection = UINavigationController()
    let navigationFavoritePhotoCollection = UINavigationController()
    let assemblyBuilder = AssemblyBuilder()
    var routerPhotoCollection: Router!
    var routerFavoritePhotoCollection: Router!

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupViewControllers()
    }

    //MARK: - setups

    private func setup() {
        tabBar.backgroundColor = .white

        routerPhotoCollection = generateRouter(navigationVC: navigationPhotoCollection, title: "wefwef", image: UIImage(systemName: "photo.on.rectangle.angled")!)
        routerPhotoCollection.initialPhotosCollectionViewController()
        routerFavoritePhotoCollection = generateRouter(navigationVC: navigationFavoritePhotoCollection, title: "Favorite", image: UIImage(systemName: "hand.thumbsup")!)
        routerFavoritePhotoCollection.initialFavoritePhotosViewController()
    }

    private func setupViewControllers() {
        viewControllers = [navigationPhotoCollection,navigationFavoritePhotoCollection]
    }

    //MARK: - private methods
    private func generateRouter(navigationVC: UINavigationController,title: String, image: UIImage) -> Router {
        let navigationVC = navigationVC
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        let assemblyBuilder = AssemblyBuilder()
        let router = Router(navigationController: navigationVC, assemblyBuilder: assemblyBuilder)
        return router
    }
}
