//
//  TopStoriesTabController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class TopStoriesTabController: UITabBarController {

    private lazy var  newsFeedVC: NewsFeedViewController = {
        let viewController = NewsFeedViewController()
        viewController.tabBarItem = UITabBarItem(title: "News Feed", image: UIImage(systemName: "eyeglasses"), tag: 0)
        return viewController
        
    }()
    
    private lazy var  savedArticleVC:SavedArticleViewController = {
        let viewController = SavedArticleViewController()
        viewController.tabBarItem = UITabBarItem(title: "Saved Article", image: UIImage(systemName: "folder"), tag: 1)
        return viewController
        
    }()
    
    private lazy var  settingsVC:SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        viewControllers = [newsFeedVC,savedArticleVC,settingsVC]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
