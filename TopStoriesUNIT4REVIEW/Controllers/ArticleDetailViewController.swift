//
//  ArticleDetailViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import ImageKit
import DataPersistence

class ArticleDetailViewController: UIViewController {
    
    public var article: Article?
    public var dataPersistence: DataPersistence<Article>!
    
    let detailView = DetailView()
    
    override func loadView() {
         view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
       updateUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(savedArticleButtonPressed))
    }
    
    private func updateUI() {
        
        guard let article = article else {
            fatalError("did not load article")
        }
        navigationItem.title = article.title
        detailView.abstractLabel.text = article.abstract
        detailView.newsImageView.getImage(with: article.getArticleImageURL(for: .superJumbo)) { [weak self](result) in
        
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.detailView.newsImageView.image = UIImage(systemName: "exclamationmark-octagon")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.newsImageView.image = image
                }
            }
        }
    }
    
    
@objc
    func savedArticleButtonPressed(_ sender: UIBarButtonItem) {
        print("saved article pressed")
    guard let article = article else {
        return
    }
    
    do {
        try dataPersistence.createItem(article)
    } catch {
        print("error savimg article - error\(error)")
    }

    }
}
