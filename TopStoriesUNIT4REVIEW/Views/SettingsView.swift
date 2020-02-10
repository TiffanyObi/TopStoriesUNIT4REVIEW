//
//  SettingsView.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/10/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
        
        
        return pickerView
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
        setUpPickerViewConstraints()
    }
    
    private func setUpPickerViewConstraints() {
        addSubview(pickerView)
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        
        ])
    }
    
}
