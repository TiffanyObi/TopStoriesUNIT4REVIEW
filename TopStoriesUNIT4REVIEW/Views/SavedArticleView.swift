//
//  SavedArticleView.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/10/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class SavedArticleView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
        
        override init(frame: CGRect) {
            super.init(frame:UIScreen.main.bounds)
            commomInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder:coder)
            commomInit()
        }
        
        private func commomInit() {
            setupCollectionViewContraints()
        }
    
    func setupCollectionViewContraints() {
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        
        ])
    }
    
    
    }


