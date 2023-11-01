//
//  MealsCardTableViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 27/10/23.
//

import UIKit

class MealsCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealsCardCL: UICollectionView!
    var meals: [Meal]?
    
    var cardSizeContent: CGSize?

    override func awakeFromNib() {
        super.awakeFromNib()
        cardSizeContent = getResponsiveGrid(estimatedWidth: 0.55, heightRatio: 0.82, grid: 1)
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.layoutIfNeeded()
        return cardSizeContent!
    }
    
    func setupUI() {
        mealsCardCL.dataSource = self
        mealsCardCL.delegate = self
        mealsCardCL.register(UINib(nibName: "MealsCardCell", bundle: nil), forCellWithReuseIdentifier: "mCardCell")
    }
    
    func configure(with meals: [Meal]) {
        self.meals = meals
        mealsCardCL.reloadData()
    }
    
}

extension MealsCardTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mCardCell", for: indexPath) as? MealsCardCollectionViewCell
        cell?.configure(with: meals![indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }
    
}

extension MealsCardTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cardSizeContent!
    }
    
    func getResponsiveGrid(estimatedWidth: CGFloat, heightRatio: CGFloat, grid: CGFloat) -> CGSize {
        let screenWidth = Constants.deviceWidth
        let deviceModel = Constants.deviceModel
        var estimatedWidth = estimatedWidth
        if deviceModel == "iPad" {
            estimatedWidth = estimatedWidth - 0.35
        }
        let cellWidth = (screenWidth * estimatedWidth) - (grid - 1) / grid
        let cellHeight = cellWidth * heightRatio
        let size = CGSize(width: cellWidth, height: cellHeight)
        print(size)
        return size
    }
}
