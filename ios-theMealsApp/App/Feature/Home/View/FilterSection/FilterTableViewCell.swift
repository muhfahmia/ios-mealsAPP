//
//  FilterHomeViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 23/10/23.
//

import UIKit

protocol FilterDelegate {
    func searchMeals(category: String)
}

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filterStackView: UIStackView!
    @IBOutlet weak var filterBtn: UIButton!
    
    var categories: [MCategory]?
    
    var homeViewDelegate: HomeViewDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    private func setupUI() {
        filterBtn.addTarget(self, action: #selector(searchMeals(_:)), for: .touchUpInside)
        filterBtn.layer.cornerRadius = 18
    }
    
    func configure(with categories: [MCategory]) {
        self.categories = categories
        let countSubviews = filterStackView.arrangedSubviews.count
        if countSubviews != self.categories?.count {
            for category in categories {
                if category.name != "Beef" {
                    let btn = UIButton(configuration: UIButton.Configuration.filled())
                    btn.setTitle(category.name, for: .normal)
                    btn.layer.cornerRadius = 18
                    btn.clipsToBounds = true
                    btn.addTarget(self, action: #selector(searchMeals(_:)), for: .touchUpInside)
                    filterStackView.addArrangedSubview(btn)
                }
            }
        }
    }
    
    @objc func searchMeals(_ sender: UIButton) {
        homeViewDelegate?.updateMeals(category: sender.currentTitle ?? "Beef")
    }
    
}
