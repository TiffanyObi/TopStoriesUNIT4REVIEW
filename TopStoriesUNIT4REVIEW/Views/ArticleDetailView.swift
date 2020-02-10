//
//  ArticleDetailView.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

    
    class DetailView: UIView {
        
        //imageView
        public lazy var newsImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .purple
            imageView.image = UIImage(systemName: "photo")
            imageView.contentMode = .scaleToFill
            return imageView
        }()
        
        //abstract headline
        public lazy var abstractLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .systemTeal
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont.preferredFont(forTextStyle: .title3)
             label.text = "Abstract Headline"
            return label
        }()
        
        //byline
        
        
        
        
        override init(frame: CGRect) {
            super.init(frame:UIScreen.main.bounds)
            commomInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder:coder)
            commomInit()
        }
        
        private func commomInit() {
            setupNewsImageViewConstriants()
            setupAbstractHeadlineConstriants()
        }
        
        private func setupNewsImageViewConstriants() {
            addSubview(newsImageView)
            newsImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            
                newsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                newsImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7)
            
            ])
        }
        
        private func setupAbstractHeadlineConstriants() {
            
            addSubview(abstractLabel)
            abstractLabel.translatesAutoresizingMaskIntoConstraints =  false
            
            NSLayoutConstraint.activate([
                abstractLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
                abstractLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                abstractLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            ])
        }
        
    }
    
    
    

