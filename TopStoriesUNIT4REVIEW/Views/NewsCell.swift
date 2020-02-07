//
//  NewsCell.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import ImageKit

class NewsCell: UICollectionViewCell {
    
    //image view of article
    //Title of article
    //abstract of article
    
    public lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Article Title"
        return label
    }()
    
    public lazy var abstractLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
         label.text = "Abstract Headline"
        return label
    }()
        
        override init(frame: CGRect) {
            super.init(frame:frame)
            commomInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder:coder)
            commomInit()
        }
        
        private func commomInit() {
            setupNewsImageViewContraints()
            setUpArticleTitleConstraints()
            setUpAbstractHeadlineConstraints()
            
        }
    
    private func setupNewsImageViewContraints() {
        addSubview(newsImageView)
        //no need for ssafe area layout in a cell because its being constrained to itself.
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            newsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)
        
        ])
    }
    
    private func setUpArticleTitleConstraints() {
        addSubview(articleTitleLabel)
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            articleTitleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            articleTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 8),
            articleTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        
        ])
    }
    
    private func setUpAbstractHeadlineConstraints() {
        addSubview(abstractLabel)
       abstractLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
    
            abstractLabel.leadingAnchor.constraint(equalTo: articleTitleLabel.leadingAnchor),
            
            abstractLabel.trailingAnchor.constraint(equalTo: articleTitleLabel.trailingAnchor, constant: -8),
            abstractLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 8)
        
        ])
    }
    
    public func configureCell(with article: Article) {
        
        articleTitleLabel.text = article.title
        
        abstractLabel.text = article.abstract
        
        newsImageView.getImage(with: article.getArticleImageURL(for: .thumbLarge)) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(systemName: "exclamationmark-octagon")
                }
                
            case.success(let image):
                DispatchQueue.main.async {
                    self?.newsImageView.image = image
                }
            }
        }
      
        
    }
    
}
    

