//
//  NewsFeedViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    private var newsFeedView = NewsFeedView()
      
      var articles = [Article]() {
        didSet {
          DispatchQueue.main.async {
            self.newsFeedView.collectionView.reloadData()
          }
        }
      }
      
      override func loadView() {
        view = newsFeedView
      }
      
      override func viewDidLoad() {
        super.viewDidLoad()
        fetchStories()
        // setting up collection view data source and delegate
        newsFeedView.collectionView.dataSource = self
        newsFeedView.collectionView.delegate = self
        
        // register the cell for collection view
        newsFeedView.collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "articleCell")
        
        view.backgroundColor = .systemBackground  // white when dark mode is off - black when dark mode on
      }
      
      private func fetchStories(for section: String = "Technology") {
        NYTTopStoriesAPIClient.fetchTopStories(for: section) { (result) in
          switch result {
          case .failure(let appError):
            print("Fetching Error:\(appError)")
          case .success(let articles):
            print("\(articles.count)")
            self.articles = articles
          }
        }
      }
      
      
    }


    extension NewsFeedViewController : UICollectionViewDataSource {
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? NewsCell else {
            fatalError("could not downcast to NewsCell")
        }
        cell.backgroundColor = .white
        
        return cell
      }
      
     
    }

    extension NewsFeedViewController : UICollectionViewDelegateFlowLayout {
      // return item size
      // itemHeight ~ 30% of nheight devide
      // itemWidth ~ 100% of width of device
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let maxSize : CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.275  // 30%
        return CGSize(width: itemWidth, height: itemHeight)
      }
   
    

}
