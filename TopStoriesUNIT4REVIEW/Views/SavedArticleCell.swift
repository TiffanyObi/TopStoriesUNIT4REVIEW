//
//  SavedArticleCell.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/10/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

//Step 1:  creating custom protocol
protocol SavedArticleCellDelegate: AnyObject {
    
    
    func didSelectMoreButton(_ savedArticleCell: SavedArticleCell, article: Article)
}

class SavedArticleCell: UICollectionViewCell {
    
    //Step 2: creating custom protocol
    weak var delegate: SavedArticleCellDelegate?
    
    // to keep travkk of the current cells article
    private var currentArticle: Article!
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let longPress = UILongPressGestureRecognizer()
        longPress.addTarget(self, action: #selector(didLongPress(_:)))
        return longPress
    }()
    
    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        
        // how do we set up a button programatically? (addTarget)
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    
    public lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.text = "The best article title I could ever think of"
        
        
        return label
    }()
    
    public lazy var newsImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "photo")
        imageView.alpha = 0
        
        return imageView
    }()
    
    private var isShowingImage = false
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        setUpMoreButtonConstraints()
        setUpArticleLableConstraints()
        setUpImageViewConstraints()
        
        addGestureRecognizer(longPressGesture)
    }
    
    @objc private func moreButtonPressed(_ sender: UIButton) {
        
        //Step 3: creating custom protocol
        delegate?.didSelectMoreButton(self, article: currentArticle)
    }
    
    
    @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        
        guard let currentArticle = currentArticle else { return }
        if gesture.state == .began || gesture.state == .changed {
            print("long pressed")
        }
        
        isShowingImage.toggle()
        
        newsImageView.getImage(with: currentArticle.getArticleImageURL(for: .normal)) { [weak self] (result) in
            switch result {
            case .failure:
                self?.newsImageView.image = UIImage(systemName: "exclamtionmark- octogon")
                
            case .success(let image):
                
                DispatchQueue.main.async {
                    self?.newsImageView.image = image
                    self?.animate()
                }
            }
        }
    }
    
    private func animate() {
        let duration : Double = 1.0
        if isShowingImage {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
                self.newsImageView.alpha = 1
                self.articleTitle.alpha = 0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
                self.newsImageView.alpha = 0
                self.articleTitle.alpha = 1
            }, completion: nil)
        }
        
    }
    
    private func setUpMoreButtonConstraints() {
        addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ moreButton.topAnchor.constraint(equalTo: topAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 60),
            moreButton.widthAnchor.constraint(equalTo: moreButton.heightAnchor)
        ])
    }
    
    private func setUpArticleLableConstraints(){
        addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            articleTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            articleTitle.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
            articleTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    private func setUpImageViewConstraints() {
        addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        
        ])
        }
    
    public func congifureCell(for savedArticle: Article){
        currentArticle = savedArticle // associating the cell with its article
        articleTitle.text = savedArticle.title
    }
}
