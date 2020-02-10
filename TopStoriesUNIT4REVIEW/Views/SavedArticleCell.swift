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
    }
    
    @objc private func moreButtonPressed(_ sender: UIButton) {
        
        //Step 3: creating custom protocol
        delegate?.didSelectMoreButton(self, article: currentArticle)
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
    
    public func congifureCell(for savedArticle: Article){
        currentArticle = savedArticle // associating the cell with its article
        articleTitle.text = savedArticle.title
    }
}
