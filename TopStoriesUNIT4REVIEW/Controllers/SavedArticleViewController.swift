//
//  SavedArticleViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import DataPersistence

class SavedArticleViewController: UIViewController {

    public var dataPersistence: DataPersistence<Article>!
    let savedArticleView = SavedArticleView()
    
    private var savedArticles = [Article]() {
        didSet {
            savedArticleView.collectionView.reloadData()
            
            if savedArticles.isEmpty {
                //set up empty view in collection/view background view
                
                savedArticleView.collectionView.backgroundView = EmptyView(title: "Saved Articles", message: "There are currently no saved articles. Start browsing by tapping on the news icon.")
            } else {
            //remove empty view from collectionView backgroup view
                savedArticleView.collectionView.backgroundView = nil
                
        }
    }
}
    override func loadView() {
        view = savedArticleView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        fetchSavedArticles()
        
        //set up collection view
        savedArticleView.collectionView.dataSource = self
        savedArticleView.collectionView.delegate = self
        
        savedArticleView.collectionView.register(SavedArticleCell.self, forCellWithReuseIdentifier: "savedArticleCell")
    }
    
    
    private func fetchSavedArticles() {
        do {
            savedArticles = try dataPersistence.loadItems()
            
        } catch {
            print("error finding articles")
    }

}
    
}
extension SavedArticleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedArticleCell", for: indexPath) as? SavedArticleCell else {
            fatalError("could not downcast to SavedArticleCell")
        }
        
        
        let cellInRow = savedArticles[indexPath.row]
        cell.congifureCell(for: cellInRow)
        cell.backgroundColor = .systemGreen
        
        //Step 1: registering as delegate
        cell.delegate = self
        return cell
    }
    
        
    }
    
    extension SavedArticleViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let maxSize:CGSize = UIScreen.main.bounds.size
            let itemSpacing:CGFloat = 10
            let numberOfItems: CGFloat = 2
            let itemHeight: CGFloat = maxSize.height * 0.30
            let totalSpacing: CGFloat = (itemSpacing * 2) + (numberOfItems - 1) * itemSpacing
            let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
            return CGSize(width: itemWidth, height: itemHeight)
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return  UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            programatically set up a segue
            
            let article = savedArticles[indexPath.row]
            let detailVC = ArticleDetailViewController()
            
            //Todo: using initializer as opposed to injecting individual properties
            detailVC.article = article
            detailVC.dataPersistence = dataPersistence
            
        }
        
    }
    
    



extension SavedArticleViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        fetchSavedArticles()
        
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
       fetchSavedArticles()
    }

}


 //Step 2: registering as delegate
extension SavedArticleViewController: SavedArticleCellDelegate {
    
    func didSelectMoreButton(_ savedArticleCell: SavedArticleCell, article: Article) {
        print("didSelectMoreButton \(article.title)")
        
        //create an action sheet
        //cancel action
        //delete action
    
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           
           let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] alertAction in
            
            self?.deleteArticle(article)
                
            }

           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
           
           alertController.addAction(deleteAction)
           alertController.addAction(cancelAction)
        present(alertController,animated: true)
        
        
    }
    
    private func deleteArticle(_ article: Article){
        guard let index = savedArticles.firstIndex(of: article) else {
                   return
               }
        
        
        do {
            
            try dataPersistence.deleteItem(at: index)
           
        } catch {
            
            print(error)
        }
        
    }
}
