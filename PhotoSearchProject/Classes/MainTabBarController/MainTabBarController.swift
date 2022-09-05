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
   // let navigationFavoritePhoto = UINavigationController()
    let assemblyBuilder = AssemblyBuilder()
    var routerPhotoCollection: Router!
    let secondVC = ViewController()

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupViewControllers()

        routerPhotoCollection = generateRouter(navigationVC: navigationPhotoCollection, title: "wefwef", image: UIImage(systemName: "photo.on.rectangle.angled")!)
    }

    //MARK: - setups

    private func setup() {
        tabBar.backgroundColor = .white
    }

    private func setupViewControllers() {
        viewControllers = [navigationPhotoCollection,ViewController()]
//        viewControllers = [ generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo.on.rectangle.angled")!), generateNavigationController(rootViewController: secondVC, title: "Favorite", image: UIImage(systemName: "hand.thumbsup")!)]
    }

    //MARK: - private methods
//    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
//        let navigationVC = UINavigationController(rootViewController: rootViewController)
//        navigationVC.tabBarItem.title = title
//        navigationVC.tabBarItem.image = image
//        return navigationVC
//    }

    private func generateRouter(navigationVC: UINavigationController,title: String, image: UIImage) -> Router {
        let navigationVC = navigationVC
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        let assemblyBuilder = AssemblyBuilder()
        let router = Router(navigationController: navigationVC, assemblyBuilder: assemblyBuilder)
        router.initialViewController()
        return router
    }
}
