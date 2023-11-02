//
//  FilterHomeViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 23/10/23.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    lazy var filterScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    lazy var filterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    var categories: [MCategory]?
    
    var homeViewDelegate: HomeViewDelegate?
    
    var categoryBtnState: UIButton? {
        willSet {
            categoryBtnState?.isSelected = false
        }
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupUI() {
        contentView.addSubview(filterScrollView)
        filterScrollView.addSubview(filterStackView)
        filterScrollView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
        filterStackView.anchor(top: filterScrollView.topAnchor, left: filterScrollView.leftAnchor, bottom: filterScrollView.bottomAnchor, right: filterScrollView.rightAnchor)
    }
    
    func configure(with categories: [MCategory]) {
        self.categories = categories
        if self.categories?.count ?? 0 > 0 {
            for category in categories {
                let btn = setupButton(with: category.name ?? "")
                filterStackView.addArrangedSubview(btn)
            }
        }
    }
    
    private func setupButton(with category: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.configuration = .plain()
        btn.setTitle(category, for: .normal)
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.layerBorderColor = .accentColor
        btn.layerBorderWidth = 2
        btn.setTitleColor(.accentColor!, for: .selected)
        btn.setBackgroundColor(color: .accentColor!, forState: .selected)
        btn.addTarget(self, action: #selector(searchMeals(_:)), for: .touchUpInside)
        return btn
    }
    
    @objc func searchMeals(_ sender: UIButton) {
        if sender != categoryBtnState {
            sender.isSelected = true
            categoryBtnState = sender
        }
        homeViewDelegate?.updateMeals(category: sender.currentTitle ?? "Beef")
    }
}
