//
//  FilterCollectionViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 23/10/23.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "filterCell"
    
    let filterName = UILabel()
    let filterBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .small
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        btn.configuration = config
        return btn
    }()
    
    var category: MCategory?
    var filterDelegate: FilterDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(filterBtn)
        filterBtn.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
        filterBtn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }
    
    func configure(with category: MCategory) {
        self.category = category
        filterBtn.setTitle(self.category?.name, for: .normal)
    }
    
    @objc func btnTapped(_ sender: UIButton) {
        filterDelegate?.searchMeals(category: category?.name ?? "Beef")
    }
    
}
