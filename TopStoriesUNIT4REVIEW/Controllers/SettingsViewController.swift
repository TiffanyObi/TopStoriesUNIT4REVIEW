//
//  SettingsViewController.swift
//  TopStoriesUNIT4REVIEW
//
//  Created by Tiffany Obi on 2/6/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

struct UserKey {
    static let newsSectionName = "News Section Name"
    static let pickerSection = 5
}

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    
    //data for pickerView
    
private let sections = ["Arts", "Automobiles", "Books", "Business", "Fashion", "Food", "Health", "Insider", "Magazine", "Movies", "NYRegion", "Obituaries", "Opinion", "Politics", "RealeEstate", "Science", "Sports", "SundayReview", "Technology", "Theater", "T-Magazine", "Travel", "Upshot", "US", "World"]
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        
    }
    


}

extension SettingsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sections.count
    }
    
    
}
extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return sections[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //store the current selected news section in my UserDefaults
        
        
       let sectionName = sections[row]
        
        UserDefaults.standard.set(sectionName, forKey: UserKey.newsSectionName)
        

        
    }
    
    
}
