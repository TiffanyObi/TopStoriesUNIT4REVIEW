//
//  TopStoriesTabController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import DataPersistence
class TopStoriesTabController: UITabBarController {
    
    private var dataPersistence = DataPersistence<Article>(filename: "savedArticles.plist")

    private lazy var  newsFeedVC: NewsFeedViewController = {
        let viewController = NewsFeedViewController()
        viewController.tabBarItem = UITabBarItem(title: "News Feed", image: UIImage(systemName: "eyeglasses"), tag: 0)
        viewController.dataPersistence = dataPersistence
        return viewController
        
    }()
    
    private lazy var  savedArticleVC:SavedArticleViewController = {
        let viewController = SavedArticleViewController()
        viewController.tabBarItem = UITabBarItem(title: "Saved Article", image: UIImage(systemName: "folder"), tag: 1)
        viewController.dataPersistence = dataPersistence
        viewController.dataPersistence.delegate = viewController
        return viewController
        
    }()
    
    private lazy var  settingsVC:SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewControllers = [UINavigationController(rootViewController:newsFeedVC),UINavigationController(rootViewController:savedArticleVC),UINavigationController(rootViewController:settingsVC)]
        // Do any additional setup after loading the view.
    }
    

    

}
