//
//  ArticleDetailViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    public var article: Article?
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
    func savedArticleButtonPressed() {
        print("saved article pressed")
    }

}
