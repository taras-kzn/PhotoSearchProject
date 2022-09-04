//
//  MainTabBarController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    //MARK: - properties
    let photosVC = PhotosCollectionViewController()
    let secondVC = ViewController()

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupViewControllers()
    }

    //MARK: - setups

    private func setup() {
        tabBar.backgroundColor = .white
    }

    private func setupViewControllers() {
        viewControllers = [ generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo.on.rectangle.angled")!), generateNavigationController(rootViewController: secondVC, title: "Favorite", image: UIImage(systemName: "hand.thumbsup")!)]
    }

    //MARK: - private methods
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
