//
//  NewsFeedViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import DataPersistence
class NewsFeedViewController: UIViewController {
    
    private var newsFeedView = NewsFeedView()
    public var dataPersistence: DataPersistence<Article>!
      
    //data for our collectionView
      var articles = [Article]() {
        didSet {
          DispatchQueue.main.async {
            self.newsFeedView.collectionView.reloadData()
            self.navigationItem.title = (self.sectionSearch) + " News"
          }
        }
      }
      
      override func loadView() {
        view = newsFeedView
      }
      
    public var sectionSearch = "Technology" {
        didSet {
            
        }
    }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
       
        // setting up collection view data source and delegate
        newsFeedView.collectionView.dataSource = self
        newsFeedView.collectionView.delegate = self
        
        // register the cell for collection view
        newsFeedView.collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "articleCell")
        
        view.backgroundColor = .systemBackground  // white when dark mode is off - black when dark mode on
        
        newsFeedView.searchBar.delegate = self
      }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         fetchStories(for: sectionSearch)
    }
    
    
    private func fetchStories(for section: String ) {
        
        if let sectionName = UserDefaults.standard.object(forKey: UserKey.newsSectionName) as? String {
            
            if sectionName != self.sectionSearch {
                
                queryApi(for: sectionName)
                self.sectionSearch = sectionName
                
            } else {
                queryApi(for: "Education")
            }
        } else {
            queryApi(for: sectionSearch)
        }
    }
    
    
    
    private func queryApi(for section:String){
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if newsFeedView.searchBar.isFirstResponder {
            newsFeedView.searchBar.resignFirstResponder()
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
            articleDetailVC.dataPersistence = dataPersistence
            articleDetailVC.article = article
            
        }

}

extension NewsFeedViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            fetchStories(for: "Technology")
            return
        }
        //filter articles based on search text
        
        articles = articles.filter { $0.title.lowercased().contains(searchText.lowercased())}
    }
}
