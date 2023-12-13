//
//  MealsCardTableViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 27/10/23.
//

import UIKit
import Domain

public class MealsCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealsCardCL: UICollectionView!
    var meals: [Meal]?
    
    var cardSizeContent: CGSize?
    
    public var mealClicked: ((Meal) -> Void)?
    
    public static var identifier: String {
        String(describing: MealsCardTableViewCell.self)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        cardSizeContent = mealsCardCL.getResponsiveGrid(estimatedWidth: 0.55, heightRatio: 0.82, grid: 1)
        setupUI()
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.layoutIfNeeded()
        return cardSizeContent!
    }
    
    func setupUI() {
        mealsCardCL.dataSource = self
        mealsCardCL.delegate = self
        mealsCardCL.register(UINib(nibName: MealsCardCollectionViewCell.identifier, bundle: Bundle.current), forCellWithReuseIdentifier: MealsCardCollectionViewCell.identifier)
    }
    
    public func configure(with meals: [Meal]) {
        self.meals = meals
        mealsCardCL.reloadData()
    }
    
}

extension MealsCardTableViewCell: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealsCardCollectionViewCell.identifier, for: indexPath) as? MealsCardCollectionViewCell
        cell?.configure(with: meals![indexPath.row])
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }
    
}

extension MealsCardTableViewCell: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cardSizeContent!
    }
}

extension MealsCardTableViewCell: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let meal = meals?[indexPath.item] else { return }
        mealClicked?(meal)
    }
}
