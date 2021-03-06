//
//  NewsFeedView.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/7/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class NewsFeedView: UIView {
    
public lazy var searchBar : UISearchBar = {
    let sb = UISearchBar()
    sb.autocapitalizationType = .none
    sb.placeholder = "search article"
    return sb
  }()
  
  public lazy var collectionView : UICollectionView = {
    // create flow layout for collection vioew
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.backgroundColor = .systemPurple
    return cv
  }()

  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    searchBarContraints()
    collectioinViewConstraints()
  }
  
  private func searchBarContraints() {
    // 1.
    addSubview(searchBar)
    
    // 2.
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    // 3.
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  private func collectioinViewConstraints() {
    // 1.
    addSubview(collectionView)
    
    // 2.
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    // 3.
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }


}

    


