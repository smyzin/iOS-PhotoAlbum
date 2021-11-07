//
//  TabBarController.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    private func configureNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        
        viewControllers = [
            configureNavigationController(rootViewController: UIViewController(), title: "Library", image: Icon.media),
            configureNavigationController(rootViewController: UIViewController(), title: "For You", image: Icon.forYou),
            configureNavigationController(rootViewController: AlbumViewController(), title: "Albums", image: Icon.album),
            configureNavigationController(rootViewController: UIViewController(), title: "Search", image: Icon.search)
        ]
    }
    
}
