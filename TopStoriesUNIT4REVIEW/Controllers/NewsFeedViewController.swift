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
      
    //data for our collectionView
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
        NYTTopStoriesAPIClient.fetchTopStories(for: section) { [weak self] (result) in
          switch result {
          case .failure(let appError):
            
            print("Fetching Error:\(appError)")
            
          case .success(let articles):
            
//         no need for DispatchQueue.main.async becaus ethere is no UI in the Api client.
            self?.articles = articles
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
        cell.backgroundColor = .systemGray2
        let cellInRow = articles[indexPath.row]
        cell.configureCell(with: cellInRow)
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
        let itemHeight: CGFloat = maxSize.height * 0.22  // 30%
        return CGSize(width: itemWidth, height: itemHeight)
      }
   
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let article = articles[indexPath.row]
            let articleDetailVC = ArticleDetailViewController()
            //ToDo: after assesment we will be using initializers as dependency injection mechanisms
            navigationController?.pushViewController(articleDetailVC, animated: true)
            articleDetailVC.article = article
            
        }

}
