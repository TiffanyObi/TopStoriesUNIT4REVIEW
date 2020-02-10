//
//  EmptyView.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/10/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Empty"
        
        return label
    }()
    
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 4
        label.textAlignment = .center
        label.text = "There are no saved articles"
        
        return label
    }()
    
   

//    override init(frame: CGRect) {
//        super.init(frame:UIScreen.main.bounds)
//        commomInit()
//    }
    
    //out initializer for an empty page. 
    init(title:String, message:String) {
        super.init(frame: UIScreen.main.bounds)
       titleLabel.text = title
       messageLabel.text = message
         commomInit()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        setUpMessageLabelConstraints()
        setUpTitleLabelConstraints()
      
    }
    
    
    private func setUpMessageLabelConstraints() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
        
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8)
    
        ])
        
        
    }
    
   private func setUpTitleLabelConstraints() {
        addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
    titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8)])
        
    }
    
  
    
    
}
